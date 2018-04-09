//
//  RootViewController.h
//  structureDemo
//
//  Created by King~Nan on 2018/3/9.
//  Copyright © 2018年 King~Nan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController

@property (nonatomic , strong) navigationCustom * navigationView;

@property (nonatomic , strong) UILabel * labelWARN;//数据为空时 提示语

/** 显示加载球 */
- (void)showLoops;
/** 隐藏加载球 */
- (void)hiddenLoops;

/** / 数据为空时 提示语  isShow : YES--> 显示  isShow : NO--> 不显示 */
- (void)isShowPromptMessges:(BOOL)isShow MessgesLabel:(NSString *)messges;
/** / 底部菜单显示隐藏  isShow : YES--> 隐藏  isShow : NO--> 显示 */
- (void)isShowTabBar:(BOOL)isShow;

@end
