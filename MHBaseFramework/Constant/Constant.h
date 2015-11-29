//
//  Constant.h
//  MHBaseFramework
//
//  Created by mahong on 15/11/29.
//  Copyright © 2015年 mahong. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  常量
 */
extern NSString * const author;

/**
 *  宏定义
 */

 /** 阻塞RunLoop */
#define obstructRunLoop(flag) \
while(flag) \
{ \
   [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]; \
}


//文件目录
#define FileManager                 [NSFileManager defaultManager]
#define kPathTemp                   NSTemporaryDirectory()
#define kPathDocument               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathCache                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathSearch(filename)       [kPathDocument stringByAppendingPathComponent:filename]
    
#endif /*Constant.h*/

