//
//  ViewController.m
//  MHBaseFramework
//
//  Created by mahong on 15/11/25.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "NetworkManager.h"
#import "Common.h"
#import "Constant.h"

#ifdef DEBUG
static NSString * const url = @"http://ac.ybjk.com/vod_v1.php?km=km3&m=sp";

#else
static NSString * const url = @"http://ac.ybjk.com/ua.php";
#endif

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"view";
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 30, 40)];
    imageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:imageView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"URL  %@",url);
//    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Accessors

#pragma mark - Public

#pragma mark - Private
- (void)requestData
{
    __block BOOL flag;
    [[NetworkManager shareManager] setTimeOutInterval:20];
    [[NetworkManager shareManager] requestHttpWithURL:url Parameter:nil Success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
         /** 请求的数据写文件 */
        NSString *filePath = [Common createFileInDocumentsWithDirectory:@"mahong" fileName:@"mahong.plist"];
        BOOL result = [responseObject writeToFile:filePath atomically:YES];
        if (result) NSLog(@"写入文件成功 %@",filePath);
        flag = YES;
        
    } Failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[Common createFileInDocumentsWithDirectory:@"mahong" fileName:@"mahong.plist"]];
    
    NSLog(@"--- dic %@",dic);
    
}

- (void)networkDidChange:(NSNotification *)notification
{
    [super networkDidChange:notification];
    
    NSLog(@"%@ 网络状态 %@",NSStringFromClass([self class]),notification.object);
}



- (void)sleep
{
    NSLog(@"sleep");
}


#pragma mark - Protocol conformance

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

#pragma mark - NSObject



@end
