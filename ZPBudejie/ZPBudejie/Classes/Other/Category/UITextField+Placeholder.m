//
//  UITextField+Placeholder.m
//  ZPBudejie
//
//  Created by 管理员 on 2016/12/30.
//  Copyright © 2016年 com. All rights reserved.
//

#import "UITextField+Placeholder.h"
#import <objc/message.h>

@implementation UITextField(Placeholder)
//当类对象加载进去的时候，就交换一下实例中的两个方法
+(void)load{
    //从编译阶段的类对象中拿到setPlaceholder的这个方法
    Method setPlaceholderMethod = class_getInstanceMethod(self, @selector((setPlaceholder:)));
    //从编译阶段的类对象中拿到setZp_Placeholder的方法
    Method setZp_PlaceholderMethod = class_getInstanceMethod(self,@selector((setZp_Placeholder:)));
    //将这两个方法进行交换,当执行系统的setPlaceHolder的时候，就执行
    //自己定义的setZp_Placeholder;
    method_exchangeImplementations(setPlaceholderMethod, setZp_PlaceholderMethod);
    
}

//拿到成员属性placeholderColor
-(UIColor *)placeholderColor{
    //得到self中的placeholderColor属性
    return objc_getAssociatedObject(self, @"placeholderColor");
}
//给成员属性赋值
-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    //给成员属性赋值
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //获取占位文字的label控件；
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    //设置站位文字颜色
    placeholderLabel.textColor=placeholderColor;
    
}

   //当在运行阶段调用setPlaceHolder方法的时候，调用setZp_PlaceHolder方法；并且不会死循环调用;以下方法，用于给placeholder属性赋值的的时候，顺便把颜色也赋值了；因为系统的setPlaceHolder方法并没有进行颜色赋值；所以还是默认的颜色；
- (void)setZp_Placeholder:(NSString *)placeholder{
    //在运行阶段调用setZp_Placeholder方法的时候，会调用set_Placeholder的方法；并且不会死循环调用
    [self setZp_Placeholder:placeholder];
    //写在等号左边的是setPlaceholderColor方法，写在等号右边的是placeHolderColor方法
    self.placeholderColor = self.placeholderColor;
}

@end
