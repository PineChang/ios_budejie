//
//  UIBarButtonItem+Item.m
//  ZPBudejie
//
//  Created by 管理员 on 2016/12/29.
//  Copyright © 2016年 com. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem(Item)

+(UIBarButtonItem *)itemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //注意button分为两部分title和image，如果只设置image而不设置title，实际上这个ttile是不存在的，因为苹果进行了懒加载处理；
    //设置常规和高亮图
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateHighlighted];
    //设置size大小为图片自适应
    [btn sizeToFit];
    //设置按钮的状态
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //将按钮包裹进一个View里面，这样，这个barButton的有效点击范围就是barbutton的大小，否则会出现button点击
    //点击范围变大
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
    
}

+(UIBarButtonItem *)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    //ios中的sizeToFit相当于android中的wrapcontent
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //frame是相对于父控件的，bounds是相对于自己，bounds的x，y是自己的contentSize部分相对于frame左上角的位置；
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    
    [containView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

+(UIBarButtonItem *)backitemWithImage:(UIImage *)image hightlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action title:(NSString *)title{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setImage:image forState:UIControlStateHighlighted];
    [backButton setImage:highlightedImage forState:UIControlStateHighlighted];
    //这是高亮和普通状态下button上文字的颜色
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //设置backbutton为自适应button
    [backButton sizeToFit];
    //让返回按钮向左移动二十个单位，如果想要微调组件的位置，可以用UIEdgeInsets；
    backButton.contentEdgeInsets=UIEdgeInsetsMake(0, -20, 0, 0);//上，左，右，下；
    
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    
}

@end
