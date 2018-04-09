//
//  SecondViewController.m
//  JMTabBarKitTest
//
//  Created by james on 15/4/28.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


- (void)viewWillAppear:(BOOL)animated
{
//    [self showLoops];//加载小圈圈
    //操作提示语
    [publicTools showHUDWithTitle:@"你当前的操作有误" andImage:nil andTime:3.0];
}

- (void)viewDidAppear:(BOOL)animated
{
//     [self hiddenLoops];//加载小圈圈
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationView.title = @"分类";
    self.navigationView.returnBtn.hidden = YES;
    
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
