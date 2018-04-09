//
//  HomeDetailViewController.m
//  Generic
//
//  Created by King~Nan on 2018/3/21.
//  Copyright © 2018年 King~Nan. All rights reserved.
//

#import "HomeDetailViewController.h"

@interface HomeDetailViewController ()//<NavigationBarDelegate>

@end

@implementation HomeDetailViewController

- (void)viewWillDisappear:(BOOL)animated
{
//    [self isShowTabBar:NO];//显示底部菜单
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self navBarAction];
//    [self isShowTabBar:YES];//隐藏底部菜单
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationView.title = @"详情页";
    
}

- (void)navBarAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
