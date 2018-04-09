//
//  NetWorkManager.h
//  云吉汇
//
//  Created by apple on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>


typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailureBlock)(NSError * error);

@interface NetWorkManager : NSObject

+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params SuccessHandler:(SuccessBlock)successHandler failureHandler:(FailureBlock)failure;

+ (void)getWithUrl:(NSString *)url SuccessHandler:(SuccessBlock)successHandler failureHandler:(FailureBlock)failure;

+ (NSDictionary *)paramsByAppendingBaseParams:(NSDictionary *)params model:(NSString *)model;

// 上传图片文件
//+ (void)postUploadFileWithImage:(UIImage *)image
//                 successHandler:(SuccessBlock)success
//                 failureHandler:(FailureBlock)failure;

@end
