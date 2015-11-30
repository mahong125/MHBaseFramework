//
//  UserConfigManager.m
//  MHBaseFramework
//
//  Created by mahong on 15/11/30.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import "UserConfigManager.h"
#import "Constant.h"

@implementation UserConfigManager

+ (instancetype)shareManager
{
    
    static UserConfigManager *_shareManager = nil;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[UserConfigManager alloc] init];
    });
    
    return _shareManager;
    
}


@end
