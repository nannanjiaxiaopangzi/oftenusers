//
//  publicTools.m
//  Generic
//
//  Created by King~Nan on 2018/3/14.
//  Copyright © 2018年 King~Nan. All rights reserved.
//

#import "publicTools.h"

@implementation publicTools
/** 
 成功或错误提示
 */
+ (MBProgressHUD *)showHUDWithTitle:(NSString *)title andImage:(NSString *)image andTime:(int)time
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        [MBProgressHUD hideHUDForView:window animated:YES];
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    if (image !=nil)
    {
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    }
    hud.labelText = title;
    hud.opacity = 0.7;
    hud.labelFont = [UIFont systemFontOfSize:16];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hide:YES afterDelay:time];
    return hud;
}


@end
