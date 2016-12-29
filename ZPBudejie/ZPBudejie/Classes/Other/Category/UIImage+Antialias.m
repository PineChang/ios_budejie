//
//  UIImage+Antialias.m
//  ZPBudejie
//
//  Created by 管理员 on 2016/12/29.
//  Copyright © 2016年 com. All rights reserved.
//

#import "UIImage+Antialias.h"

@implementation UIImage(Antialias)

-(UIImage*)imageAntialias
{

    UIImage *img = nil;
    //开始绘制一个image的上下文；
    UIGraphicsBeginImageContext(self.size);
    //将对象中的像素绘制进去；
    [self drawInRect:CGRectMake(-1,-1, self.size.width,self.size.height)];
    //将上下文中的像素绘制给img对象；
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:CGRectMake(1.0f,1.0f, self.size.width,self.size.width)];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
    
    
    
}

@end
