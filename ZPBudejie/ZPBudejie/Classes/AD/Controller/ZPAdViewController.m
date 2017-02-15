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
    if(iphone6P){
        
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
        
    }else if(iphone6){
        self.launchImageView.image=[UIImage imageNamed:@"LaunchImage-800-667h"];
        
    }else if(iphone5){
        self.launchImageView.image=[UIImage imageNamed:@"LaunchImage-568h"];
    }else if(iphone4){
        self.launchImageView.image=[UIImage imageNamed:@"LaunchImage-700"];
    }
    
    
}

//第二步加载广告图片数据；
- (void)loadAdData{
    //创建回话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    //设置发起请求的参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"]=code2;
    
    //向服务器发送get请求
    
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //请求成功的回调block处理
        //获取字典
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        //字典转模型
        self.item = [ZPADItem mj_objectWithKeyValues:adDict];
        //此时模型中就封装了要广告数据,包括图片的原始宽高
        //我们要设置一张宽度为屏幕宽度，高度为高度乘以原图片宽度缩放比例的图片，此时图片能保持宽高比
        CGFloat h = ZPScreenW / self.item.w * self.item.h;
        
        self.adView.frame = CGRectMake(0,0,ZPScreenW,h);
        
        [self.adView sd_setImageWithURL:[NSURL URLWithString:self.item.w_picurl]];
        
        
        
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败的回调block处理
        NSLog(@"%@",error);
        
        
    }];
    
    
    
}
//采用懒加载的形式，第一次用的时候进行判空创建，
-(UIImageView *)adView{
    //第一次用的时候进行判空创建，并将其添加进adContainView
    if(_adView==nil){
        UIImageView *imageView = [[UIImageView alloc] init];
         //此时添加进去后并没有设置Frame，因为需要请求服务器端，获取原始图片的宽高才能进行适配
        [self.adContentView addSubview:imageView];
       
        //给添加的UIImageView进行添加手势判断，当点击的时候，跳进广告的链接
        UITapGestureRecognizer *tg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [imageView addGestureRecognizer:tg];
        //不要忘记打开UIImageView的用户交互设置
        imageView.userInteractionEnabled= YES;
        
        _adView = imageView;
    }
    
   
    return _adView;
    
    
}

//点击广告跳转的逻辑
-(void)tap{
    NSURL *url = [NSURL URLWithString:self.item.ori_curl];
    UIApplication *app = [UIApplication sharedApplication];
    if([app canOpenURL:url]){
        [app openURL:url];
    }
}

//点击跳转按钮要做的逻辑
- (IBAction)tapJump:(id)sender {
    
    ZPTabBarController * tabBarVc = [[ZPTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController=tabBarVc;
    //记住，当跳转后，一定要把定时器干掉
    [_timer invalidate];
}
//定时器数过三秒后，进行跳转
- (void)timeChange{
    //不要设置全局变量，作为函数内部静态的局部变量，不会销毁，每次调用都存在；
    static int i = 3;
    //如果函数执行三次后，此时i为0，直接进行跳转
    if(i==0){
        [self tapJump:nil];
    }
    i--;
    //此时还未跳转，那么就将文字进行改变
    [self.jumpBtn setTitle:[NSString stringWithFormat:@"跳转(%i)",i] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
