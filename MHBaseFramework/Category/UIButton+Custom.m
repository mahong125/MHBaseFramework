//
//  UIButton+Custom.m
//  MHBaseFramework
//
//  Created by mahong on 15/11/29.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import "UIButton+Custom.h"

@implementation UIButton (Custom)

+ (instancetype)initWithFrame:(CGRect)frame
{
    return [UIButton initWithFrame:frame title:nil];
}

+ (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    return [UIButton initWithFrame:frame title:title backgroundImage:nil];
}

+ (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)backgroundImage
{
    return [UIButton initWithFrame:frame title:title backgroundImage:backgroundImage highlightedBackgroundImage:nil];
}

+ (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)backgroundImage highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
    
    return button;
}

@end
