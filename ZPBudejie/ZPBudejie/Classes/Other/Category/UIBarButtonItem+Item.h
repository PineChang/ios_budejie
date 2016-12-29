//
//  UIBarButtonItem+Item.h
//  ZPBudejie
//
//  Created by 管理员 on 2016/12/29.
//  Copyright © 2016年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem(Item)
    //快速创建BarButtonItem；
//给定image的normal图，高亮图，响应的事件方法
+(UIBarButtonItem *)itemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action;
//给定image的normal图，选择图，响应的事件方法
+(UIBarButtonItem *) itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action;

//特殊的返回barButton
+(UIBarButtonItem *)backitemWithImage:(UIImage *)image hightlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action title:(NSString *) title;
@end
