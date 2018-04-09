//
//  ThirdViewController.m
//  JMTabBarKitTest
//
//  Created by james on 15/4/28.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationView.title = @"我的";
    self.navigationView.returnBtn.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotLogin) name:@"NoLogin" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DidLogin) name:@"DidLogin" object:nil];
}


- (void)NotLogin
{
    LoginViewController * loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:^{
        [[NSUserDefaults standardUserDefaults] setObject:@"login" forKey:@"login"];
    }];
}

- (void)DidLogin
{
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"login"];
    }];
}


- (void)dealloc
{
    //移除观察者 _observe
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"DidLogin" object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"NoLogin" object:nil];
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
