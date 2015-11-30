//
//  BaseViewController.m
//  MHBaseFramework
//
//  Created by mahong on 15/11/30.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import "BaseViewController.h"
#import "Constant.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkDidChange:) name:networkDidChangeNotificationName object:nil];
}

- (void)networkDidChange:(NSNotification *)notification
{
     /** 走通知栏提醒用户*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
