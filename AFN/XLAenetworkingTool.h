//
//  XLAenetworkingTool.h
//  LookEveryday
//
//  Created by zhangwei Luo on 2018/2/2.
//  Copyright © 2018年 wxLian. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFNetworking;
/**
 *  网络状态
 */
typedef NS_ENUM(NSInteger, XLnetworkStatus) {
    /**
     *  未知网络
     */
    XLnetworkStatusUnknown             = 1 << 0,
    /**
     *  无法连接
     */
    XLnetworkStatusNotReachable        = 1 << 1,
    /**
     *  WWAN网络
     */
    XLnetworkStatusReachableViaWWAN    = 1 << 2,
    /**
     *  WiFi网络
     */
    XLnetworkStatusReachableViaWiFi    = 1 << 3
};


typedef void (^HttpSuccessBlock)(id json);
typedef void (^HttpFailureBlock)(NSError * error);
typedef void (^HttpDownloadProgressBlock)(CGFloat progress);
typedef void (^HttpUploadProgressBlock)(CGFloat progress);

@interface XLAenetworkingTool : NSObject



/**
 *设置请求头
 */
+ (void)setValue:(NSString *)value ForHeaderField:(NSString *)field;

/**
 *移除所有请求头
 */
+ (void)removeAllHeaderField;

//设置固定的请求头  防止数据被篡改
+ (void)setDefaultHeaderWithDic:(NSDictionary *)dic userId:(NSString *)userId;


+ (void)checkNetworkStatus:(void(^)(XLnetworkStatus networkStatus))callBack;//网络检测



/**
 *  get网络请求
 *
 *  @param path    url地址
 *  @param params  url参数  NSDictionary类型
 *  @param success 请求成功 返回NSDictionary或NSArray
 *  @param failure 请求失败 返回NSError
 */

+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure;

/**
 *  post网络请求
 *
 *  @param path    url地址
 *  @param params  url参数  NSDictionary类型
 *  @param success 请求成功 返回NSDictionary或NSArray
 *  @param failure 请求失败 返回NSError
 */

+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure;


/**
 *  下载文件
 *
 *  @param path     url路径
 *  @param success  下载成功
 *  @param failure  下载失败
 *  @param progress 下载进度
 */
//+ (void)downloadWithPath:(NSString *)path
//                 success:(HttpSuccessBlock)success
//                 failure:(HttpFailureBlock)failure
//                progress:(HttpDownloadProgressBlock)progress;


/**
 上传图片

 @param path url地址
 @param params 上传参数
 @param imagekey imagekey
 @param fileName 文件名
 @param image UIImage对象
 @param success 上传成功
 @param failure 上传失败
 @param progress 上传进度
 */
//+ (void)uploadImageWithPath:(NSString *)path
//                     params:(NSDictionary *)params
//                  thumbName:(NSString *)imagekey
//                   fileName:(NSString *)fileName
//                      image:(UIImage *)image
//                    success:(HttpSuccessBlock)success
//                    failure:(HttpFailureBlock)failure
//                   progress:(HttpUploadProgressBlock)progress;











@end
