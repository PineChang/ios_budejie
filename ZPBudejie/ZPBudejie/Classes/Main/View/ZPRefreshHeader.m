//
//  ZPRefreshHeader.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/21.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ZPRefreshHeader.h"

@implementation ZPRefreshHeader
//重写父类的initWithFrame方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        self.stateLabel.textColor = [UIColor blueColor];
        self.stateLabel.font = [UIFont systemFontOfSize:17];
        //还未达到刷新下拉条件的状态
        [self setTitle:@"赶紧下拉刷新" forState:MJRefreshStateIdle];
        [self setTitle:@"松开马上刷新" forState:MJRefreshStatePulling];
        [self setTitle:@"正在拼命刷新" forState:MJRefreshStateRefreshing];
        self.lastUpdatedTimeLabel.hidden = YES;
        //自动切换透明度
        self.automaticallyChangeAlpha = YES;
    }
    return self;
}

@end
