//
//  BaseViewController.h
//  MHBaseFramework
//
//  Created by mahong on 15/11/30.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworkReachabilityManager.h"


@interface BaseViewController : UIViewController

- (void)networkDidChange:(NSNotification *)notification;

@end
