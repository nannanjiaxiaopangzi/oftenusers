//
//  NavBarView.h
//  云吉汇
//
//  Created by apple on 2016/12/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavBarDelegate <NSObject>

- (void)navBarAction;

@end

@interface NavBarView : UIView
@property (nonatomic, strong) UIView * navBar;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) id<NavBarDelegate> delegate;
    
@property (nonatomic, strong) UILabel * navLab;
@property (nonatomic, strong) UIButton * returnBtn;
    
@end
