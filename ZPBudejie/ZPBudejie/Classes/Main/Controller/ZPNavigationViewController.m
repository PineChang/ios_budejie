
//
//  ZPNavigationViewController.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/16.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ZPNavigationViewController.h"

#import "UIBarButtonItem+Item.h"

@interface ZPNavigationViewController ()<UIGestureRecognizerDelegate>
@end

@implementation ZPNavigationViewController

+(void)load{
    //自定义导航条标题
    //拿到UINavigationController中的UINavigationBar
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    //设置导航条的中间标题属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:attrs];
    
    //设置导航条背景图片，其实导航条背景是一个图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigatiobarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    //修改UINavigationController的转场transition切换模式，把pop弹出切换变为pan滑动切换
    
    //这就需要把原来的手势切换模式换为滑动切换模式,er这种切换的作用于原来的pop切换的代理
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransiton:)];
    //当NavigationController中的View滑动的时候就会触发handleNavigationTransiton的方法，进行切换
    [self.view addGestureRecognizer:pan];
    
    pan.delegate = self;
    //将系统默认的pop切换关闭
    self.interactivePopGestureRecognizer.enabled = NO;
    
}

//决定是否触发手势,当只有是非根控制器的时候才能触发手势
-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.childViewControllers.count > 1;
}
//---------第二个需求是当切换的时候，所有非根控制器的导航条左按钮都为返回按钮

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(self.childViewControllers.count>0){//当压入栈是非根控制器的时候
        
        //在跳转之前做以下两方面工作
        //首先将底部的TabBar隐藏掉
        viewController.hidesBottomBarWhenPushed = YES;
        //其次将导航栏的左边的BarButtton变为返回按钮箭头
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backitemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] hightlightedImage:@"navigationButtonReturnClick" target:self action:@selector(back) title:@"返回"];
        //在做完前面的工作后，开始跳转
        [super pushViewController:viewController animated:animated];
        
        
        
        
    }
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

@end
























