//
//  UIImageView+DownLaod.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/1/7.
//  Copyright © 2017年 com. All rights reserved.
//

#import "UIImageView+DownLaod.h"
#import <AFNetworkReachabilityManager.h>
#import <UIImageView+WebCache.h>

@implementation UIImageView(DownLaod)

-(void)Zp_setOriginImage:(NSString *)originImageURL thumbnailImage:(NSString *)thumbnailImageURL placeholder:(UIImage *)placeholder completed:(id)completedBlock{
    //拿到网络判定管理中心,根据网络状态来加载图片
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    //先从硬盘获取原图，SDWebImage的图片缓存是根据图片的url作为key
    UIImage *originImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:originImageURL];
    //如果硬盘已经存在这张图了,就直接将这张高清图赋值给自身；
    if(originImage){
        [self sd_setImageWithURL:[NSURL URLWithString:originImageURL] placeholderImage:placeholder completed:completedBlock];
    //如果原图从未被下载过，那么就去网络上下载，
    }else{
        //如果Wifi可以连接，那么就用Wifi下载
        if (mgr.isReachableViaWiFi) {
            [self sd_setImageWithURL:[NSURL URLWithString:] completed:<#^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL)completedBlock#>]
        }
        
    }
}

@end
