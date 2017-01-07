//
//  UIImageView+DownLaod.h
//  ZPBudejie
//
//  Created by 管理员 on 2017/1/7.
//  Copyright © 2017年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIImageView+WebCache.h>

#import <UIKit/UIKit.h>

@interface UIImageView(DownLaod)
//还未加载前为占位图，加载后是小图，当点击开后为原始大图；
-(void)Zp_setOriginImage:(NSString *) originImageURL thumbnailImage:(NSString *)thumbnailImageURL placeholder:(UIImage *)placeholder completed:(SDWebImageCompletionBlock) completedBlock;

@end
