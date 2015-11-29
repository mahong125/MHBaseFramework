//
//  NetworkManager.h
//  MHBaseFramework
//
//  Created by mahong on 15/11/26.
//  Copyright © 2015年 mahong. All rights reserved.
//

/**
 *  网络请求单例类
 */

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

/**
 *  网络请求成功回调
 *
 *  @param operation 操作信息
 *  @param error     错误信息
 */
typedef void (^httpRequestSuccess) (AFHTTPRequestOperation *operation, NSDictionary *responseObject);

/**
 *  网络请求失败回调
 *
 *  @param operation 操作信息
 *  @param error     错误信息
 */
typedef void (^httpRequestFailure) (AFHTTPRequestOperation *operation, NSError *error);


@interface NetworkManager : NSObject

/**
 *  AFHTTPRequestOperationManager 对象
 */
@property (strong, nonatomic) AFHTTPRequestOperationManager *httpRequestManager;

/**
 *  缓存策略
 */
@property (assign, nonatomic) NSURLRequestCachePolicy cachePolicy;

/**
 *  超时时间，默认3s
 */
@property (assign, nonatomic) CGFloat timeOutInterval;


/**
 *  网络请求单例
 *
 *  @param baseURL 请求URL
 *
 *  @return 单例
 */
+ (instancetype)shareManager;

/**
 *  GET 方式网络请求 支持Block回调
 *
 *  @param url       请求链接
 *  @param parameter 请求参数
 *  @param success   成功回调
 *  @param failure   失败回调
 */
- (void)requestHttpWithURL:(NSString *)url Parameter:(NSDictionary *)parameter Success:(httpRequestSuccess)success Failure:(httpRequestFailure)failure;

/**
 *  POST 方式网络请求 支持Block回调
 *
 *  @param url       请求链接
 *  @param parameter 请求参数
 *  @param success   成功回调
 *  @param failure   失败回调
 */
- (void)postHttpWithURL:(NSString *)url Parameter:(NSDictionary *)parameter Success:(httpRequestSuccess)success Failure:(httpRequestFailure)failure;


@end
