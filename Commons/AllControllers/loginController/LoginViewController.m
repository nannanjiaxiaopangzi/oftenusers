//
//  ViewController.m
//  JMTabBarKitTest
//
//  Created by James on 2016/12/4.
//  Copyright © 2016年 James. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];

//    self.navigationView.title = @"我的";
//    self.navigationView.returnBtn.hidden = YES;
    self.navigationView.hidden = YES;
    
    [self setupViews];
}

- (void)setupViews {
    UILabel *label      = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
    label.text          = @"请先登录";
    label.textColor     = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.userInteractionEnabled=YES;
    [self.view addSubview:label];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    [label addGestureRecognizer:tap];
}

- (void)close {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"login"];
    [self dismissViewControllerAnimated:YES
                                 completion:nil];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
