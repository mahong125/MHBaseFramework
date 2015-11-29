//
//  NetworkManager.m
//  MHBaseFramework
//
//  Created by mahong on 15/11/26.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

/**
 *  网络请求单例
 *
 *  @param baseURL 请求URL
 *
 *  @return 单例
 */
+ (instancetype)shareManager
{
    static NetworkManager *_shareManager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _shareManager = [[NetworkManager alloc] init];
    });
    
    return _shareManager;
}

/**
 *  获取 AFHTTPRequestOperationManager 实例
 *
 *  @return httpRequestManager
 */
- (AFHTTPRequestOperationManager *)httpRequestManager
{
    if (!_httpRequestManager)
    {
        _httpRequestManager = [AFHTTPRequestOperationManager manager];
        
        /** Response 序列化 Json格式 */
        _httpRequestManager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        /** 设置content-type  */
        _httpRequestManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", @"text/html", nil];
        
        /** 自定义http头文件 */
        [_httpRequestManager.requestSerializer setValue:@"Lonely" forHTTPHeaderField:@"author"];
        
        /** 设置默认超时时间 3s*/
        [_httpRequestManager.requestSerializer setTimeoutInterval:3.0];
        
    }
    
    return _httpRequestManager;
}

/**
 *  GET 方式网络请求 支持Block回调
 *
 *  @param url       请求链接
 *  @param parameter 请求参数
 *  @param success   成功回调
 *  @param failure   失败回调
 */
- (void)requestHttpWithURL:(NSString *)url Parameter:(NSDictionary *)parameter Success:(httpRequestSuccess)success Failure:(httpRequestFailure)failure
{
     /** 设置自定义超时时间 */
    [self configTimeourInterval];
    
    [self.httpRequestManager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
         /** 业务逻辑判断 */
        success(operation, responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(operation, error);
    }];
}

/**
 *  POST 方式网络请求 支持Block回调
 *
 *  @param url       请求链接
 *  @param parameter 请求参数
 *  @param success   成功回调
 *  @param failure   失败回调
 */
- (void)postHttpWithURL:(NSString *)url Parameter:(NSDictionary *)parameter Success:(httpRequestSuccess)success Failure:(httpRequestFailure)failure
{
    
    [self configTimeourInterval];
    
    [self.httpRequestManager POST:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
         /** 业务逻辑判断 */
        success(operation, responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
        failure(operation, error);
    }];
}

/**
 * 设置自定义超时时间
 */
- (void)configTimeourInterval
{
    if (self.timeOutInterval)
    {
        [self.httpRequestManager.requestSerializer setTimeoutInterval:self.timeOutInterval];
    }
}

@end
