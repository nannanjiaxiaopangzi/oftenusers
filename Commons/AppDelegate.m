//
//  AppDelegate.m
//  Commons
//
//  Created by King~Nan on 2018/4/8.
//  Copyright © 2018年 King~Nan. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
  
     [self starApp];//创建底部菜单
    
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - TabBar
-(void)starApp
{
    
    if(self._tabBarController ){
        return;
    }
    
    
    UIColor * color = [UIColor grayColor];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    
    NSMutableDictionary *textArrays = [NSMutableDictionary dictionary];
    textArrays[NSForegroundColorAttributeName] = [UIColor yellowColor];
    
    self._tabBarController = [[UITabBarController alloc] init];
    
    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:self._tabBarController];
    
    
    _navCrl=nav;
    
    
    
    UITabBarItem *item0 = [[UITabBarItem alloc]init];//0
    item0.title = @"精选";
    [item0 setTitleTextAttributes:  [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:34/255.0 green:139/255.0 blue:34/255.0 alpha:1],NSForegroundColorAttributeName,nil]forState:UIControlStateSelected];
    UIImage *imageSelected = [UIImage imageNamed:@"t01_t"];
    UIImage *imageNormal = [UIImage imageNamed:@"t01"];
    item0.image = [imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.selectedImage = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    UITabBarItem *item1 = [[UITabBarItem alloc]init];//1
    item1.title = @"分类";
    [item1 setTitleTextAttributes:  [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:34/255.0 green:139/255.0 blue:34/255.0 alpha:1],NSForegroundColorAttributeName,nil]forState:UIControlStateSelected];
    imageSelected = [UIImage imageNamed:@"t02_t"];
    imageNormal = [UIImage imageNamed:@"t02"];
    item1.image = imageNormal;
    [imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.selectedImage = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    UITabBarItem *item2 = [[UITabBarItem alloc]init];//3
    item2.title = @"互动";
    [item2 setTitleTextAttributes:  [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:34/255.0 green:139/255.0 blue:34/255.0 alpha:1],NSForegroundColorAttributeName,nil]forState:UIControlStateSelected];
    imageSelected = [UIImage imageNamed:@"t02_t"];
    imageNormal = [UIImage imageNamed:@"t02"];
    item2.image = imageNormal;
    [imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *item3 = [[UITabBarItem alloc]init];//2
    item3.title = @"我的";
    [item3 setTitleTextAttributes:  [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:34/255.0 green:139/255.0 blue:34/255.0 alpha:1],NSForegroundColorAttributeName,nil]forState:UIControlStateSelected];
    imageSelected = [UIImage imageNamed:@"t03_t"];
    imageNormal = [UIImage imageNamed:@"t03"];
    item3.image = imageNormal;
    [imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.selectedImage = [imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    

    
    NSMutableArray *vcArray = [[NSMutableArray alloc] init];
    
    FirstViewController *selectVC=[[FirstViewController alloc]init];
    selectVC.tabBarItem=item0;
    [vcArray addObject:selectVC];
    
    SecondViewController *classVC =[[SecondViewController alloc]init];
    classVC.tabBarItem=item1;
    [vcArray addObject:classVC];
    
    InteractiveViewController * gammeVc=[[InteractiveViewController alloc]init];
    gammeVc.tabBarItem=item2;
    [vcArray addObject:gammeVc];
    
    ThirdViewController *shopVC = [[ThirdViewController alloc]init];
    //    ShoppingCarViewController *shopVC = [[ShoppingCarViewController alloc] init];
    shopVC.tabBarItem=item3;
    [vcArray addObject:shopVC];
    
    //
    //    ETMineViewController *mineVC = [[ETMineViewController alloc] init];
    //    mineVC.tabBarItem=item3;
    //    [vcArray addObject:mineVC];
    
    
    
    
    self._tabBarController.viewControllers = vcArray;
    
    
    self._tabBarController.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:240 / 255.0 green:239 / 255.0 blue:244 / 255.0 alpha:1];
    
    
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    
    self._tabBarController.navigationController.navigationBar.titleTextAttributes = dict;
    //self._tabBarController.navigationController.navigationBar.translucent = NO;
    self._tabBarController.navigationController.navigationBar.tintColor=[UIColor grayColor];
    self._tabBarController.delegate=self;
    
    
    self._tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    
    // self._tabBarController.tabBar.translucent = NO;
    //    self._tabBarController.tabBar.tintColor = HEADBAR_COLOR;
    
        self.window.rootViewController = nav;
    
//    self.window.rootViewController = self._tabBarController;
    
    //此段代码是为了 先执行ETMineViewController 实例中的 viewdidload 方法
    //    UIView * v= mineVC.view;
    //    v.hidden=NO;
    //结束
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
    if ([viewController isKindOfClass:[ThirdViewController class]]) {
      
        BOOL isLog = [[NSUserDefaults standardUserDefaults] objectForKey:@"login"];
        
        if (isLog) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"DidLogin" object:nil];
        } else{
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"NoLogin" object:nil];
        }
        
    }
    NSLog(@"%@",viewController);
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
