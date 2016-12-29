//
//  UIImage+Image.m
//  ZPBudejie
//
//  Created by 管理员 on 2016/12/29.
//  Copyright © 2016年 com. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage(Image)
//生成一个原始图片，系统没有渲染过的；
+(instancetype) imageOriginalWithName:(NSString *)imageName{
    //先创建一个UIImage对象；
    UIImage *image = [UIImage imageNamed:imageName];
    
   return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}
//对UIImage对象进行圆形化处理
-(instancetype) zp_circleImage{
    //在图形的表面生成一个和图片一样的图形上下文；
    UIGraphicsBeginImageContext(self.size);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0,0 , self.size.width, self.size.height)];
    //对图片进行裁剪；
    [path addClip];
    //设置从0，0点开始拿图片
    [self drawAtPoint:CGPointZero];
    //从图片中取得这张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}
//生成一个圆形化的图片
+ (instancetype) zp_circleImageNamed:(NSString *)name{
    
    return [[self imageNamed:name] zp_circleImage];
    
}
@end
