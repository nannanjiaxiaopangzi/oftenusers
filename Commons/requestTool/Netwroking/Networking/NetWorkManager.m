//
//  NetWorkManager.m
//  云吉汇
//
//  Created by apple on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NetWorkManager.h"

@implementation NetWorkManager

+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params SuccessHandler:(SuccessBlock)successHandler failureHandler:(FailureBlock)failure {
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    /*
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
     */
    /*
     [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
     manager.requestSerializer = [AFHTTPRequestSerializer serializer];
     */
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        //
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successHandler) {
            successHandler(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)getWithUrl:(NSString *)url SuccessHandler:(SuccessBlock)successHandler failureHandler:(FailureBlock)falure {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successHandler) {
            successHandler(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (falure) {
            falure(error);
        }
    }];
    
}

// 上传图片文件
//+ (void)postUploadFileWithImage:(UIImage *)image successHandler:(SuccessBlock)success failureHandler:(FailureBlock)failure {
//    NSData * imageData;
//    //判断图片是不是png格式的文件
//    if (UIImagePNGRepresentation(image)) {
//        //返回为png图像。
//        imageData = UIImagePNGRepresentation(image);
//    }else {
//        //返回为JPEG图像。
//        imageData = UIImageJPEGRepresentation(image, 1.0);
//    }
//    
//    NSString * uploadURL = [NSString stringWithFormat:@"%@UploadFile?", SYC_URL];
//    NSDictionary * paremeter = @{@"needThumbnail":@"1", @"needWatermark":@"1"};
//    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
//                                                         @"text/html",
//                                                         @"image/jpeg",
//                                                         @"image/png",
//                                                         @"application/octet-stream",
//                                                         @"text/json",
//                                                         nil];
//    
//    
//    [manager POST:uploadURL parameters:paremeter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = @"yyyyMMddHHmmss";
//        NSString * str = [formatter stringFromDate:[NSDate date]];
//        NSString * fileName = [NSString stringWithFormat:@"%@.png", str];
//        [formData appendPartWithFileData:imageData name:@"AppFile" fileName:fileName mimeType:@"image/png"];
//        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        // 上传进度
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSInteger status = [responseObject[@"Status"] integerValue];
//        if (status == 1) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}

//用私有方法构造参数或者直接将字典写在所在控制界面里
+ (NSDictionary *)paramsByAppendingBaseParams:(NSDictionary *)params model:(NSString *)model {
    NSMutableDictionary * reparams = [params mutableCopy];
    reparams[@"g"] = @"ApiGGC";
    reparams[@"m"] = model;
    return reparams;
}

@end
