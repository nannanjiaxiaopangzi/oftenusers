//
//  MessageManager.h
//  云吉汇
//
//  Created by apple on 2016/12/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageManager : NSObject

//随机生成验证码
+ (NSString *)getAuthcode:(NSInteger)kCharCount;
//获取到验证码之后发送验证码短信
+ (void)sendAuth:(NSString *)phoneNum action:(NSString *)authcode;
//手机正则表达式判断
+ (BOOL)isMobileNumber:(NSString *)molileNum;

@end
