//
//  ViewController.m
//  MHBaseFramework
//
//  Created by mahong on 15/11/25.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

//static NSString * const url = @"http://ac.ybjk.com/vod_v1.php?km=km3&m=sp";
static NSString * const url = @"http://ac.ybjk.com/ua.php";

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Accessors

#pragma mark - Public

#pragma mark - Private

- (void)testRequest
{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     /** 一定要先序列化 然后进行操作 */
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
     /**  */
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", @"text/html", nil];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"res %@",responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"结果 %@ ",operation.responseString);

    }];
    
//    [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//       
//        NSLog(@"task %@",task);
//        
//        NSLog(@"responseObject %@",responseObject);
//        
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        
//    }];
}

#pragma mark - Protocol conformance

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

#pragma mark - NSObject



@end
