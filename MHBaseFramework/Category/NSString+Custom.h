//
//  NSString+Custom.h
//  MHBaseFramework
//
//  Created by mahong on 15/11/29.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>

@interface NSString (Custom)

/**
 *  MD5 加密
 *
 *  @return 加密后字符串
 */
- (NSString *)md5String;

/**
 *  sha1 加密
 *
 *  @return 加密后字符串
 */
- (NSString *)sha1String;

/**
 *  base64 加密
 *
 *  @return 加密后字符串
 */
- (NSString *)base64EncodedString;


/**
 *  URL 编码
 *
 *  @return 编码字符串
 */
- (NSString *)stringByURLEncode;


/**
 *  已知文本宽度，获取文本高度
 *
 *  @param font  字体
 *  @param width 宽度
 *
 *  @return 高度
 */
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;

/**
 *  去除字符串首尾空格
 *
 *  @return 字符串
 */
- (NSString *)stringByTrim;

/**
 *  判断字符串是否为空  nil, @"", @"  ", @"\n"
 *
 *  @return
 */
- (BOOL)isNotBlank;

/**
 *  判断字符串知否包含子串
 *
 *  @param string 子串
 *
 *  @return
 */
- (BOOL)containsString:(NSString *)string;

/**
 *  字符串转换为NSData
 *
 *  @return nsdata
 */
- (NSData *)dataValue;

/**
 *  Json字符串转化字典
 *
 *  @return 字典
 */
- (NSDictionary *)jsonStringConvertToDictionary;

/**
 *  获得设备的UUID
 *
 *  @return UUID
 */
+ (NSString *)UUID;

/**
 *  判断是否为邮箱格式
 *
 *  @return bool
 */
- (BOOL)isEmail;

/**
 *  Base64 加密
 *
 *  @return 加密字符串
 */
- (NSString *)encodeToBase64;

/**
 *  Base64 解密
 *
 *  @return 解密字符串
 */
- (NSString *)decodeBase64;

@end
