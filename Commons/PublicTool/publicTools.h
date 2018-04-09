//
//  publicTools.h
//  Generic
//
//  Created by King~Nan on 2018/3/14.
//  Copyright © 2018年 King~Nan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface publicTools : NSObject

/** 成功或错误提示 */
+ (MBProgressHUD *)showHUDWithTitle:(NSString *)title andImage:(NSString *)image andTime:(int)time;

@end
