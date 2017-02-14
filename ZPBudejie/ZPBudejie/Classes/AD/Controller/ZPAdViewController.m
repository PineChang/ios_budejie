//
//  ZPAdViewController.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/14.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ZPAdViewController.h"
//导入网络框架
#import <AFNetworking/AFNetworking.h>
//导入模型
#import "ZPADItem.h"
//导入文件扩展
#import <MJExtension/MJExtension.h>
//UIImageView+WebCache在SDWebImage中的扩展
#import <UIImageView+WebCache.h>
//
#import "ZPTabBarController.h"
//定义一个宏用来进行获取广告
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface ZPAdViewController ()
//要跳过计时按钮
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
//广告占位按钮
@property (weak, nonatomic) IBOutlet UIView *adContentView;
//开机运行的按钮
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;

//网络请求后封装的模型数据
@property(weak,nonatomic) ZPADItem *item;

//用来保存广告图片的UIImageView

@property(weak,nonatomic) UIImageView *adView;

//用来计时的timer

@property(weak,nonatomic) NSTimer *timer;





@end

@implementation ZPAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //第一步：设置启动的图片
    [self setupLaunchImage];
    //第二步：加载广告数据
    [self loadAdData];
    //第三步：创建定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
   

}
//第一步设置启动图片
-(void)setupLaunchImage{
  //由于不同的iphone手机有不用的尺寸，那么就应该通过平台进行判断到底yoga
    //用哪一种的图片
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

*/

@end
