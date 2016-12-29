//
//  UIView+Frame.h
//  ZPBudejie
//
//  Created by 管理员 on 2016/12/29.
//  Copyright © 2016年 com. All rights reserved.
//

#import <UIKit/UIKIt.h>

@interface UIView(Frame)
/*
 由于改变一个View的大小位置，其实是修改其frame的值，frame是一个结构体
 所以直接修改比较麻烦，所以就直接将其抽取后变为UIView的分类；
 */
@property CGFloat zp_width;

@property CGFloat zp_height;

@property CGFloat zp_x;

@property CGFloat zp_y;

@property CGFloat zp_centerX;

@property CGFloat zp_centerY;


@end
