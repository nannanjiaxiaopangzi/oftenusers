//
//  navigationCustom.h
//  Generic
//
//  Created by King~Nan on 2018/3/15.
//  Copyright © 2018年 King~Nan. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol NavigationBarDelegate <NSObject>

- (void)navBarAction;

@end



@interface navigationCustom : UIView

@property (nonatomic, strong) UIView * navBar;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) id<NavigationBarDelegate> delegate;

@property (nonatomic, strong) UILabel * navLab;
@property (nonatomic, strong) UIButton * returnBtn;

@end
