//
//  NavBarView.m
//  云吉汇
//
//  Created by apple on 2016/12/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NavBarView.h"

@interface NavBarView ()
//    {
//        UILabel * _navLab;
//    }
@end

@implementation NavBarView


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
	
	if (self) {
		self = [super initWithCoder:aDecoder];
	}
    _navBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
//	UIView * navBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
//	navBar.backgroundColor = BasisColor;
     _navBar.backgroundColor = [UIColor colorWithRed:21/255.0 green:157/255.0 blue:235/255.0 alpha:1.0];
	[self addSubview:_navBar];
	
	_returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 25, 30, 30)];
	[_returnBtn setImage:[UIImage imageNamed:@"返回图片"] forState:(UIControlStateNormal)];
	
//    returnBtn.backgroundColor = [UIColor redColor];

    
	[_returnBtn addTarget:self action:@selector(returnAction:) forControlEvents:(UIControlEventTouchUpInside)];
	[self addSubview:_returnBtn];
	
    
    _navLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2, 20)];
//    _navLab.backgroundColor = [UIColor redColor];
    _navLab.textColor = [UIColor whiteColor];
    _navLab.textAlignment = 0;
    _navLab.center = CGPointMake(WIDTH/2 - WIDTH/9 , 40);
    [self addSubview:_navLab];

    
	return self;
}



- (instancetype)initWithFrame:(CGRect)frame {
    if (self) {
        self = [super initWithFrame:frame];
    }
  _navBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
//    navBar.backgroundColor = BasisColor;
    _navBar.backgroundColor = [UIColor colorWithRed:21/255.0 green:157/255.0 blue:235/255.0 alpha:1.0];

    [self addSubview:_navBar];
    
     _navLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2, 20)];
//    _navLab.backgroundColor = [UIColor redColor];
    _navLab.textAlignment = 0;
    _navLab.center = CGPointMake(WIDTH/2 - WIDTH/9, 40);
    _navLab.textColor = [UIColor whiteColor];
    [self addSubview:_navLab];
    
    _returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 25, 30, 30)];
    [_returnBtn setImage:[UIImage imageNamed:@"返回图片"] forState:(UIControlStateNormal)];
//    returnBtn.backgroundColor = [UIColor redColor];
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
