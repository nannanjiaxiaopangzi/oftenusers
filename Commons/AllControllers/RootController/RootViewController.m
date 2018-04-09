//
//  RootViewController.m
//  structureDemo
//
//  Created by King~Nan on 2018/3/9.
//  Copyright © 2018年 King~Nan. All rights reserved.
//

#import "RootViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface RootViewController ()<NavigationBarDelegate>



@end

@implementation RootViewController

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
self.navigationController.interactivePopGestureRecognizer.delegate=(id<UIGestureRecognizerDelegate>)self;
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    self.navigationController.navigationBarHidden = YES;
    
    self.navigationView = [[navigationCustom alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
    self.navigationView.title = @"我是Root 空空如也";
    self.navigationView.delegate = self;
    [self.view addSubview:self.navigationView];
    
    [self initWarnLabel];//数据提示语
}

- (void)navBarAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ---- 显示加载球
-(void)showLoops
{
    [EasyLodingView showLodingText:@"加载中..."];
    NSLog(@"看我显身术");
}
#pragma mark ---- 隐藏加载球
-(void)hiddenLoops
{
    [EasyLodingView hidenLoding];
    NSLog(@"看我隐身术");
}

#pragma mark ---- 数据提示语
- (void)initWarnLabel
{
    self.labelWARN = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, WIDTH - 30, 35)];
    self.labelWARN.center = CGPointMake(WIDTH/2, HEIGHT/2);
    self.labelWARN.font = [UIFont systemFontOfSize:18.0];
    self.labelWARN.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    self.labelWARN.textAlignment = 1;
    self.labelWARN.numberOfLines = 0;
    self.labelWARN.adjustsFontSizeToFitWidth = YES;
    self.labelWARN.hidden = YES;
    [self.view addSubview:self.labelWARN];
}
//是否显示提示语
- (void)isShowPromptMessges:(BOOL)isShow MessgesLabel:(NSString *)messges
{
    if (isShow) {//显示
        self.labelWARN.text = messges;
        self.labelWARN.hidden = NO;
    } else{
        self.labelWARN.text = messges;
        self.labelWARN.hidden = YES;
    }
}

#pragma mark ---- 底部菜单是否显示
- (void)isShowTabBar:(BOOL)isShow
{
    self.tabBarController.tabBar.hidden = isShow;
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
