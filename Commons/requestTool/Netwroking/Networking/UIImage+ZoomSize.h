//
//  UIImage+ZoomSize.h
//  绘图
//
//  Created by xlzhang on 15/12/13.
//  Copyright © 2015年 xlzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZoomSize)
- (UIImage *)resizedImagetoWidth:(CGFloat)width;
- (UIImage *)resizedImageToSize:(CGSize)size;
@end
