//
//  XLAenetworkingTool.m
//  LookEveryday
//
//  Created by zhangwei Luo on 2018/2/2.
//  Copyright © 2018年 wxLian. All rights reserved.
//

#import "XLAenetworkingTool.h"
//#import "AFNetworking.h"
//static NSString * kBaseUrl = IP;

@interface AFHttpManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

@end

@implementation AFHttpManager

+ (instancetype)sharedManager {
    
    static AFHttpManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        manager = [[AFHttpManager alloc] initWithSessionConfiguration:configuration];
        //        client.responseSerializer = [AFHTTPResponseSerializer serializer];
        //        client.requestSerializer = [AFHTTPRequestSerializer serializer];
        //接收参数类型
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",@"text/html",@"text/json",@"text/plain",@"text/javascript",@"text/xml",@"image/*", @"application/octet-stream",@"application/zip"]];
         //设置超时时间
         manager.requestSerializer.timeoutInterval = 15.0f;
         //安全策略
         manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
     });
    
         return manager;
 }
 @end

@implementation XLAenetworkingTool
/*
+ (void)checkNetworkStatus:(void(^)(XLnetworkStatus))callBack{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                callBack(XLnetworkStatusNotReachable);
                break;
            case AFNetworkReachabilityStatusUnknown:
                callBack(XLnetworkStatusUnknown);
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                callBack(XLnetworkStatusReachableViaWWAN);
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                callBack(XLnetworkStatusReachableViaWiFi);
                break;
            default:
                callBack(XLnetworkStatusUnknown);
                break;
            }
    }];
}
*/
#pragma mark -
#pragma mark - get请求
+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure {
    
    /*
    //获取完整的url路径
    //AFN没有做UTF8转码 防止URL字符串中含有中文或特殊字符发生崩溃
    NSString * URLString = [NSString new];
    if ([path containsString:@"http"]) {
        URLString = path;
    }else {
        URLString = [[NSString  stringWithFormat:@"%@%@",kBaseUrl,path] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    */
    [[AFHttpManager sharedManager] GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [NetworkTool removeAllHeaderField];
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [NetworkTool removeAllHeaderField];
        failure(error);
        
    }];
    
}
#pragma mark -
#pragma mark - post请求
+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure {
    
    /*
    //获取完整的url路径
    //AFN没有做UTF8转码 防止URL字符串中含有中文或特殊字符发生崩溃
    NSString * URLString = [NSString new];
    if ([path containsString:@"http"]) {
        URLString = path;
    }else {
        URLString = [[NSString  stringWithFormat:@"%@%@",kBaseUrl,path] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    */
    
    [[AFHttpManager sharedManager] POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [NetworkTool removeAllHeaderField];
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [NetworkTool removeAllHeaderField];
        failure(error);
        
    }];
    
}









@end
