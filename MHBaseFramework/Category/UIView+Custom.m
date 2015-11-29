//
//  UIView+Custom.m
//  MHBaseFramework
//
//  Created by mahong on 15/11/29.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import "UIView+Custom.h"

@implementation UIView (Custom)

- (CGFloat)mh_left {
    return self.frame.origin.x;
}

- (void)setMh_left:(CGFloat)mh_left
{
    CGRect frame = self.frame;
    frame.origin.x = mh_left;
    self.frame = frame;
}

- (CGFloat)mh_top {
    return self.frame.origin.y;
}

- (void)setMH_top:(CGFloat)mh_top {
    CGRect frame = self.frame;
    frame.origin.y = mh_top;
    self.frame = frame;
}

- (CGFloat)mh_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setMH_right:(CGFloat)mh_right {
    CGRect frame = self.frame;
    frame.origin.x = mh_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)mh_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setMH_bottom:(CGFloat)mh_bottom {
    CGRect frame = self.frame;
    frame.origin.y = mh_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)mh_width {
    return self.frame.size.width;
}

- (void)setMH_width:(CGFloat)mh_width {
    CGRect frame = self.frame;
    frame.size.width = mh_width;
    self.frame = frame;
}

- (CGFloat)mh_height {
    return self.frame.size.height;
}

- (void)setMH_height:(CGFloat)mh_height {
    CGRect frame = self.frame;
    frame.size.height = mh_height;
    self.frame = frame;
}

- (CGFloat)mh_centerX {
    return self.center.x;
}

- (void)setMH_centerX:(CGFloat)mh_centerX {
    self.center = CGPointMake(mh_centerX, self.center.y);
}

- (CGFloat)mh_centerY {
    return self.center.y;
}

- (void)setMH_centerY:(CGFloat)mh_centerY {
    self.center = CGPointMake(self.center.x, mh_centerY);
}

- (CGPoint)mh_origin {
    return self.frame.origin;
}

- (void)setMH_origin:(CGPoint)mh_origin {
    CGRect frame = self.frame;
    frame.origin = mh_origin;
    self.frame = frame;
}

- (CGSize)mh_size {
    return self.frame.size;
}

- (void)setMH_size:(CGSize)mh_size {
    CGRect frame = self.frame;
    frame.size = mh_size;
    self.frame = frame;
}


@end
