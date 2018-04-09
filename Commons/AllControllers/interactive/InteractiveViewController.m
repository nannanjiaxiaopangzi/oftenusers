//
//  InteractiveViewController.m
//  Commons
//
//  Created by King~Nan on 2018/4/8.
//  Copyright © 2018年 King~Nan. All rights reserved.
//

#import "InteractiveViewController.h"

@interface InteractiveViewController ()

@end

@implementation InteractiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self isShowPromptMessges:YES MessgesLabel:@"当前无数据,快去创建数据和我一起互动吧!"];
    
    self.navigationView.title = @"互动";
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
