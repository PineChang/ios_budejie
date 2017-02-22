//
//  ZPEssenceViewController.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/16.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ZPEssenceViewController.h"

#import "ZPTitleButton.h"

@interface ZPEssenceViewController ()

//标题栏用UIView
@property(nonatomic,weak) UIView *titlesView;
//标题栏下面用来选中的的标题下划线
@property(nonatomic,weak) UIView *titleUnderline;
//用来保存上一次点击的标题按钮
@property(nonatomic,weak) ZPTitleButton *previousClickedTitleButton;

//用来存放所有自控制器View的scrollView

@property(nonatomic,weak) UIScrollView *scrollView;

@end

@implementation ZPEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //第0步：初始化自控制器
    [self setupAllChildVcs];
   //第一步：设置导航条
    [self setupNavBar];
   //第二步设置标题栏
    [self setupTitlesView];
    //第三步：设置scrollView；
    [self setupScrollView];
    //第四步：添加第0个自控制器
    [self addChildvcViewIntoScrollView:0];
}

//第0步：初始化自控制器
-(void) setupAllChildVcs{
    self addChildViewController:[
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
