//
//  ZPADItem.h
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/14.
//  Copyright © 2017年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPADItem : NSObject
//广告的图片地址
@property(nonatomic,strong) NSString *w_picurl;

//广告图片的宽度

@property(nonatomic,assign) CGFloat w;

//广告图片的高度

@property(nonatomic,assign) CGFloat h;

//点击广告后跳转的地址

@property(nonatomic,strong) NSString *ori_curl;



@end
