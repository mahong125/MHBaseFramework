//
//  UIView+Custom.h
//  MHBaseFramework
//
//  Created by mahong on 15/11/29.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Custom)

@property (assign, nonatomic) CGFloat mh_left;        ///< Shortcut for frame.origin.x.
@property (assign, nonatomic) CGFloat mh_top;         ///< Shortcut for frame.origin.y
@property (assign, nonatomic) CGFloat mh_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (assign, nonatomic) CGFloat mh_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (assign, nonatomic) CGFloat mh_width;       ///< Shortcut for frame.size.width.
@property (assign, nonatomic) CGFloat mh_height;      ///< Shortcut for frame.size.height.
@property (assign, nonatomic) CGFloat mh_centerX;     ///< Shortcut for center.x
@property (assign, nonatomic) CGFloat mh_centerY;     ///< Shortcut for center.y
@property (assign, nonatomic) CGPoint mh_origin;      ///< Shortcut for frame.origin.
@property (assign, nonatomic) CGSize  mh_size;        ///< Shortcut for frame.size.

@end
