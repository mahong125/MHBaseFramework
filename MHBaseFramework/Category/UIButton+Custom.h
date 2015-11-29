//
//  UIButton+Custom.h
//  MHBaseFramework
//
//  Created by mahong on 15/11/29.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Custom)

/**
 *  根据frame创建button
 *
 *  @param frame Button's frame
 *
 *  @return button
 */
+ (instancetype)initWithFrame:(CGRect)frame;

/**
 *  根据frame title 创建button
 *
 *  @param frame Button's frame
 *  @param title Button's title, the title color will be white
 *
 *  @return button
 */
+ (instancetype)initWithFrame:(CGRect)frame
              title:(NSString *)title;

/**
 *  根据frame title backgroundImage 创建button
 *
 *  @param frame           Button's frame
 *  @param title           Button's title
 *  @param backgroundImage Button's background image
 *
 *  @return button
 */
+ (instancetype)initWithFrame:(CGRect)frame
              title:(NSString *)title
    backgroundImage:(UIImage *)backgroundImage;

/**
 *  根据frame title backgroundImage highlightedBackgroundImage 创建button
 *
 *  @param frame                      Button's frame
 *  @param title                      Button's title
 *  @param backgroundImage            Button's background image
 *  @param highlightedBackgroundImage Button's highlighted background image
 *
 *  @return button
 */
+ (instancetype)initWithFrame:(CGRect)frame
              title:(NSString *)title
    backgroundImage:(UIImage *)backgroundImage
highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage;


@end
