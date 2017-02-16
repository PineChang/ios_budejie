//
//  ZPTabBarController.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/14.
//  Copyright © 2017年 com. All rights reserved.
//
//一个标签控制器
#import "ZPTabBarController.h"
//导航控制器
#import "ZPNavigationViewController.h"
//五个控制器
#import "ZPEssenceViewController.h"
#import "ZPFriendTrendViewController.h"
#import "ZPMeViewController.h"
#import "ZPNewViewController.h"
#import "ZPPublishViewController.h"
//一个扩展
#import "UIImage+Image.h"
//一个自定义控件
#import "ZPTabBar.h"

@interface ZPTabBarController ()

@end

@implementation ZPTabBarController

+(void)load{
    //获取UITabBarItem；
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    //设置Title选中状态下的时候前景色为黑色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    //设置在正常状态下Title的字体大小
    NSMutableDictionary *attrsNor  = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加五个自控制器
    [self setupAllChildViewController];
    //设置tabBar上Button的内容 ->
    
    [self setupAllTitleButton];
    
    //自定义tabBar
    
    [self setupTabBar];
}
//第一步添加所有子控制器
- (void) setupAllChildViewController{
    //精华控制器
    ZPEssenceViewController *essenceVc = [[ZPEssenceViewController alloc] init];
    
    ZPNavigationViewController *nav = [[ZPNavigationViewController alloc] initWithRootViewController:essenceVc];
    
    [self addChildViewController:nav];
    //新帖控制器
    
    ZPNewViewController * newVc = [[ZPNewViewController alloc] init];
    ZPNavigationViewController *nav1 = [[ZPNavigationViewController alloc] initWithRootViewController:nav1];
    [self addChildViewController:nav1];
    
    //关注控制器
    
    ZPFriendTrendViewController *ftVc = [[ZPFriendTrendViewController alloc] init];
    
    ZPNavigationViewController * nav3 = [[ZPNavigationViewController alloc] initWithRootViewController:ftVc];
    
    [self addChildViewController:nav3];
    //我控制器
    //拿到名字是ZPMeViewController的storyboard；
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([ZPMeViewController class]) bundle:nil];
    //拿到storyabord中的箭头指向的控制器,将其赋值给ZPMeViewController，因为他的类型就是ZPMeViewController
    ZPMeViewController *meVc = [storyboard instantiateInitialViewController];
    ZPNavigationViewController *nav4 = [[ZPNavigationViewController alloc] initWithRootViewController:meVc];
    [self addChildViewController:nav4];
    
}

-(void)setupAllTitleButton{
    
    UINavigationController *nav = self.childViewControllers[0];
    nav.tabBarItem.title=@"精华";
    nav.tabBarItem.image=[UIImage imageNamed:@"tabBar_essence_icon"];
    nav.tabBarItem.selectedImage=[UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    
    UINavigationController *nav1 = self.childViewControllers[1];
    nav1.tabBarItem.title=@"新帖";
    nav1.tabBarItem.image=[UIImage imageNamed:@"tabBar_new_icon"];
    nav1.tabBarItem.selectedImage=[UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
    
    UINavigationController *nav3 = self.childViewControllers[2];
    nav3.tabBarItem.title=@"关注";
    nav3.tabBarItem.image=[UIImage imageNamed:@"tabBar_friendTrends_icon"];
    nav3.tabBarItem.selectedImage=[UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];
    
    
    UINavigationController *nav4 = self.childViewControllers[3];
    nav4.tabBarItem.title=@"我";
    nav4.tabBarItem.image=[UIImage imageNamed:@"tabBar_me_icon"];
    nav4.tabBarItem.selectedImage=[UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];
    
    
    
}

//第三部将tabBar换成自定义的TabBar
-(void)setupTabBar{
    ZPTabBar *tabBar = [[ZPTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
