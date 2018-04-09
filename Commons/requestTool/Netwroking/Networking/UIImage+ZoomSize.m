//
//  UIImage+ZoomSize.m
//  绘图
//
//  Created by xlzhang on 15/12/13.
//  Copyright © 2015年 xlzhang. All rights reserved.
//

#import "UIImage+ZoomSize.h"

@implementation UIImage (ZoomSize)

- (UIImage *)resizedImagetoWidth:(CGFloat)width {
    // 第一步 先获得图片尺寸
    CGFloat imageW = self.size.width;
    CGFloat imageH = self.size.height;
    if (imageW > width) {
        imageW = width;
        imageH = width / self.size.width * imageH;
    }
    // 获得调整后图片尺寸
    CGSize imageSize = CGSizeMake(imageW, imageH);
    // 创建图形上下文
    UIGraphicsBeginImageContext(imageSize);
    // 画图
    [self drawInRect:CGRectMake(0, 0, imageW, imageH)];
    // 获得绘制后的图片
    UIImage *resizeImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return resizeImage;
}

- (UIImage *)resizedImageToSize:(CGSize)size {
    // 获得图片等尺寸
    CGFloat imageW = self.size.width;
    CGFloat imageH = self.size.height;
    // 判断
    if (imageW > size.width) {
        // 调整图片缩放比例
        imageW = size.width;
        imageH = size.width / self.size.width * imageH;
    }
    // 获得开启图形上下文的尺寸
    CGSize refSize = CGSizeMake(imageW, imageH);
    /**
     *  开启图片图形上下
     *
     *  @param refSize  上下文尺寸
     *  @param opaque 透明度 YES 不透明  NO 透明
     *  @param scale 缩放比例 一般设为0.0 --- > 0.5
     */
    UIGraphicsBeginImageContextWithOptions(refSize, YES, 0.5);
    // 绘制图形
    [self drawInRect:CGRectMake(0, 0, imageW, imageH)];
    // 将绘制的图形上下转换为图片
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 返回
    return resizedImage;
}



@end





