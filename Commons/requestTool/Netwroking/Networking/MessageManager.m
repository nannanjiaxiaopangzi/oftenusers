//
//  MessageManager.m
//  云吉汇
//
//  Created by apple on 2016/12/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MessageManager.h"
#import <AFNetworking.h>

@interface MessageManager ()

@end

@implementation MessageManager

//生成验证码kCharCount是生成验证码个数
+ (NSString *)getAuthcode:(NSInteger)kCharCount {
    //字符串素材
    NSArray *dataArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    NSMutableString *authCodeStr = [[NSMutableString alloc] initWithCapacity:kCharCount];
    //随机从数组中选取需要个数的字符串，拼接为验证码字符串
    for (int i = 0; i < kCharCount; i++) {
        NSInteger index = arc4random() % (dataArray.count-1);
        NSString *tempStr = [dataArray objectAtIndex:index];
        authCodeStr = (NSMutableString *)[authCodeStr stringByAppendingString:tempStr];
    }
    return authCodeStr;
}

//发送验证码
+ (void)sendAuth:(NSString *)phoneNum action:(NSString *)authcode {
    //发送短信调用
    NSString * urlStr = [NSString stringWithFormat:@"%@BatchSend2.aspx?CorpID=XALKY00640&Pwd=fg@0640&Mobile=%@&Content=您的验证码为%@,有效时间%@分钟&Cell=&SendTime=",@"http://yzm.mb345.com/utf8/",phoneNum,authcode,@"30"];
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString * URLString = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:set];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"image/jpeg",@"image/png",@"application/octet-stream",@"text/json",nil];
    [manager GET:URLString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

//手机号正则表达式判断
+ (BOOL)isMobileNumber:(NSString *)mobileNum {
    NSString * MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$";
    NSString * CM = @"^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$";
    NSString * CU = @"^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$";
    NSString * CT = @"^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
