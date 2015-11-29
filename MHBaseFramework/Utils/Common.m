//
//  Common.m
//  MHBaseFramework
//
//  Created by mahong on 15/11/29.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import "Common.h"

@implementation Common

/**
 *  在Documents 路径下创建文件
 *
 *  @param directory 目录
 *  @param fileName  文件名
 *
 *  @return 文件路径
 */
+ (NSString *)createFileInDocumentsWithDirectory:(NSString *)directory fileName:(NSString *)fileName
{
    if (!directory) directory = @"";
    
    if (!fileName) return nil;
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@/",docPath,directory];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSError *error = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:&error];
        
        if (error) return nil;
    }
    
    return [filePath stringByAppendingPathComponent:fileName];
}

@end
