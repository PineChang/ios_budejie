//
//  ZPTabBar.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/16.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ZPTabBar.h"

@interface ZPTabBar ()
//特别添加的Button
@property(nonatomic,weak) UIButton *plusButton;
//记录上一次点击的按钮
@property(nonatomic,weak) UIControl *previousClickedTabBarButton;

@end

@implementation ZPTabBar


//懒加载获取这个➕号的button

-(UIButton *)plusButton{
   UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    //点击一下就高亮一下，而不是一直selected高亮
    [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
    //sizeToFit有点像android中的wrapContent
    [btn sizeToFit];
    //注意此时并没有指定btn的frame
    [self addSubview:btn];
    
   return _plusButton;
}
//在这里进行对button的frame进行赋值
-(void) layoutSubviews{
    //获取tabBar总共有几个子item 即几个tabBarButtonItem，并不是所有的子View，因为除了item，tabBar还要其他想不到的ziView
    NSInteger count = self.items.count;
    //每一个按钮的宽度宽度等于总宽度除以包含的item的个数，注意此时plusButton还未加进子View所以，要加1；
    CGFloat btnW = self.zp_width/(count+1);
    //每一个按钮的高度就是tabBar的高度
    CGFloat btnH = self.zp_height;
    
    int  i = 0;
    //第一个Button的x坐标为0，所有的button的y坐标为0；
    CGFloat x = 0;
    
    //遍历子控件，找出所有是Button的子View；
    for (UIControl *tabBarButton in self.subviews) {
        if([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            
            //如果第一次初始化还一次都没有点击的情况下，遍历出的第一个Button就默认为以前刚刚点击过的Button
            if(i==0 && self.previousClickedTabBarButton==nil){
                self.previousClickedTabBarButton=tabBarButton;
            }
            //如果i==2说明，已经要开始布局第三个button了，也就是我们自己定义的加号的button，那么就直接跳过
            if(i==2){
                i+=1;
            }
            x = i*btnW;
            
            tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
            
            i++;
            
            //设置完按钮的位置信息后，那么下一步就要设置按钮的点击事件
            //因为原来的点击事件不能实现重复点击刷新页面的需求
            
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            //最后就加上特殊的加号按钮
            self.plusButton.center = CGPointMake(self.zp_width*0.5, self.zp_height*0.5);
            
        }
    }
    
    
}
-(void)tabBarButtonClick:(UIControl *)tabBarButton{
    //如果点击传进来的按钮等于上一次的按钮，那么久发出通知；否则的话将当次点击的按钮作为上一次点击的按钮
    if(self.previousClickedTabBarButton == tabBarButton){
        [[NSNotificationCenter defaultCenter] postNotificationName:ZPTabBarButtonDidRepeatClickNotification object:nil];
    }
    //如果点击的不是当前按钮那么就代表切换，不是重复点击刷新，我们不用管，只用将这次点击作为previous
    
    self.previousClickedTabBarButton = tabBarButton;
}

@end















