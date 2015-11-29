//
//  NSString+Custom.m
//  MHBaseFramework
//
//  Created by mahong on 15/11/29.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import "NSString+Custom.h"

@implementation NSString (Custom)

/**
 *  MD5 加密
 *
 *  @return 加密后字符串
 */
- (NSString *)md5String
{
    //  将传入OC字符串转换成C字符串
    const char *cStr = [self UTF8String];
    //  无符号字符数组 16位
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (uint32_t)strlen(cStr), digest);
    
    NSMutableString *encryptionString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH *2];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        //  将转换后的字符转换成16进制, 02表示不足两位前面补0,  例如 "a" -> "0a",  "3" -> "03"
        [encryptionString appendFormat:@"%02x",digest[i]];
    }
    
    return encryptionString;
}

/**
 *  sha1 加密
 *
 *  @return 加密后字符串
 */
- (NSString *)sha1String
{
    //  将字符串转换成 C字符串
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    //  C字符串转换成二进制数据
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (uint32_t)data.length, digest);
    
    NSMutableString *encryptionString = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [encryptionString appendFormat:@"%02x", digest[i]];
    }
    
    return encryptionString;
}

/**
 *  base64 加密
 *
 *  @return 加密后字符串
 */
static const char base64EncodingTable[64] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

- (NSString *)base64EncodedString
{
    NSUInteger length = self.length;
    if (length == 0)
        return @"";
    
    NSUInteger out_length = ((length + 2) / 3) * 4;
    uint8_t *output = malloc(((out_length + 2) / 3) * 4);
    if (output == NULL)
        return nil;
    
    const char *input = [self UTF8String];
    NSInteger i, value;
    for (i = 0; i < length; i += 3) {
        value = 0;
        for (NSInteger j = i; j < i + 3; j++) {
            value <<= 8;
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        NSInteger index = (i / 3) * 4;
        output[index + 0] = base64EncodingTable[(value >> 18) & 0x3F];
        output[index + 1] = base64EncodingTable[(value >> 12) & 0x3F];
        output[index + 2] = ((i + 1) < length)
        ? base64EncodingTable[(value >> 6) & 0x3F]
        : '=';
        output[index + 3] = ((i + 2) < length)
        ? base64EncodingTable[(value >> 0) & 0x3F]
        : '=';
    }
    
    NSString *base64 = [[NSString alloc] initWithBytes:output
                                                length:out_length
                                              encoding:NSASCIIStringEncoding];
    free(output);
    return base64;
}


/**
 *  URL 编码
 *
 *  @return 编码字符串
 */
- (NSString *)stringByURLEncode
{
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL, kCFStringEncodingUTF8));
    
    return encodedString;
}

- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

/**
 *  已知文本宽度，获取文本高度
 *
 *  @param font  字体
 *  @param width 宽度
 *
 *  @return 高度
 */
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width
{
    CGSize size = [self sizeForFont:font size:CGSizeMake(width, HUGE) mode:NSLineBreakByWordWrapping];
    return size.height;
}

/**
 *  去除字符串首尾空格
 *
 *  @return 字符串
 */
- (NSString *)stringByTrim
{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}


/**
 *  判断字符串是否为空  nil, @"", @"  ", @"\n"
 *
 *  @return
 */
- (BOOL)isNotBlank
{
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

/**
 *  判断字符串知否包含子串
 *
 *  @param string 子串
 *
 *  @return
 */
- (BOOL)containsString:(NSString *)string;
{
    if (string == nil) return NO;
    return [self rangeOfString:string].location != NSNotFound;
}

/**
 *  字符串转换为NSData
 *
 *  @return nsdata
 */
- (NSData *)dataValue
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

/**
 *  Json字符串转化字典
 *
 *  @return 字典
 */
- (NSDictionary *)jsonStringConvertToDictionary
{
    NSError *error = nil;
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&error];
    
    if (error) return nil;
    
    return  dic;
}

@end
