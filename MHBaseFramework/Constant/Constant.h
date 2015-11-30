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
UIKIT_EXTERN NSString * const author;
UIKIT_EXTERN NSString * const networkDidChangeNotificationName;

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

#define Singleton(Class) static Class *_shareManager = nil; \
dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
    _shareManager = [[Class alloc] init]; \
}); \
return _shareManager;

#endif /*Constant.h*/

