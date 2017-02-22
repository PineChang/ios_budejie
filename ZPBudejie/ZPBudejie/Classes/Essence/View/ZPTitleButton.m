//
//  ZPTitleButton.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/22.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ZPTitleButton.h"
/*
 指定构造方法
 后面带有NS_DESIGNATED_INITIALIZER的方法为指定构造方法
 子类如果重写了父类的指定构造方法，那么必须调用super调用父类的特定构造方法
 */

@implementation ZPTitleButton

-(instancetype) initWithFrame:(CGRect)frame{
    if(self = [super  initWithFrame:frame]){
        //一个button由titleLabel和imageView组成
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        //根据Button的状态来动态的改变titleLabel的文字颜色
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
    }
    return self;
}


@end






