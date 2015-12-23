//
//  DemoViewController.m
//  MHBaseFramework
//
//  Created by mahong on 15/11/26.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import "DemoViewController.h"
#import "ViewController.h"
#import "UIButton+Custom.h"
#import <OpenUDID.h>
#import <stdarg.h>

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"demo";
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ViewController *view = [[ViewController alloc] init];
    self.viewController = view;
    [self.navigationController pushViewController:self.viewController animated:YES];
}


- (void)networkDidChange:(NSNotification *)notification
{
    [super networkDidChange:notification];
    
    NSLog(@"%@ 网络状态 %@",NSStringFromClass([self class]),notification.object);
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
