//
//  Common.h
//  MHBaseFramework
//
//  Created by mahong on 15/11/29.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

/**
 *  在Documents 路径下创建文件
 *
 *  @param directory 目录
 *  @param fileName  文件名
 *
 *  @return 文件路径
 */
+ (NSString *)createFileInDocumentsWithDirectory:(NSString *)directory fileName:(NSString *)fileName;

@end
