//
//  navigationCustom.m
//  Generic
//
//  Created by King~Nan on 2018/3/15.
//  Copyright © 2018年 King~Nan. All rights reserved.
//

#import "navigationCustom.h"

@implementation navigationCustom

- (instancetype)initWithFrame:(CGRect)frame {
    if (self) {
        self = [super initWithFrame:frame];
    }
    
    //背景(用于调节背景颜色)
    _navBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
    _navBar.backgroundColor = BASIS;
    
    [self addSubview:_navBar];

    //标题
    _navLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2, 20)];
    _navLab.textAlignment = 1;
    _navLab.center = CGPointMake(WIDTH/2 , 40);
//    _navLab.center = CGPointMake(WIDTH/2 - WIDTH/9, 40);
    _navLab.textColor = [UIColor whiteColor];
    [self addSubview:_navLab];

    
    //返回按钮
    _returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 25, 30, 30)];
    [_returnBtn setImage:[UIImage imageNamed:@"back"] forState:(UIControlStateNormal)];
    [_returnBtn addTarget:self action:@selector(returnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:_returnBtn];
    
    return self;
}

- (void)returnAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(navBarAction)]) {
        [self.delegate navBarAction];
    }
}

- (void)setTitle:(NSString *)title{
    _title = title;
    _navLab.text = title;
}

@end
