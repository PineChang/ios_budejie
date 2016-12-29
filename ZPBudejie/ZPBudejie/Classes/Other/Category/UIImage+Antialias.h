//
//  UIImage+Antialias.h
//  ZPBudejie
//
//  Created by 管理员 on 2016/12/29.
//  Copyright © 2016年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Antialias)

//返回一张抗锯齿的图片
//本质是在图片生成一个透明度为1的像素边框

-(UIImage*)imageAntialias;

@end
