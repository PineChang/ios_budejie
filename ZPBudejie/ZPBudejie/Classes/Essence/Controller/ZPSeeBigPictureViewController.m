//
//  ZPSeeBigPictureViewController.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/27.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ZPSeeBigPictureViewController.h"
#import "ZPTopic.h"
#import <SVProgressHUD.h>
#import <Photos/Photos.h>

@interface ZPSeeBigPictureViewController()<UIScrollViewDelegate>

@property(nonatomic,weak) UIScrollView *scrollView;
@property(nonatomic,weak) UIImageView *imageView;
//创建当前app的相册
-(PHAssetCollection *)createdCollection;
//返回刚才保存到相机胶卷的图片
-(PHFetchResult<PHAsset *> *)createdAssets;
@end

@implementation ZPSeeBigPictureViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = [UIScreen mainScreen].bounds;
    //给scrollView一个点击事件当点击scrollView的时候，就返回原来的页面
    [scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)]];
    //imageView
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.image1] completed:^(UIImage *image,NSError *error,SDImageCacheType cacheType,NSURL *imageURL){
        //如果显示的image在保存到硬盘后不为null，那么就让saveButton有效；
        if(!image) return;
        self.saveButton.enabled = YES;
    }]
    //设置imageView
    //因为scrollView的bounds为屏幕的大小
    //设置imageView的宽度为屏幕的宽度
    imageView.zp_width = scrollView.zp_width;
    //imageView的高度为宽度的伸缩倍数乘以原来的高
    imageView.zp_height = self.topic.height * imageView.zp_width/self.topic.width;
    imageView.zp_x = 0;
    if(imageView.zp_height>XMGScreenH){
        imageView.zp_y = 0;
        //当超过一个屏幕的时候，就让scrollView
        //的contentSize的高度为图片的高度
        scrollView.contentSize = CGSizeMake(0,imageView.zp_height);
        
    }else{
        //如果没有超过一个高度，那么就让这个图片显示scrollView的正中央
        imageView.zp_centerY = scrollView.zp_height*0.5;
    }
    
    //添加进视图
    [scrollView addSubview:imageView];
    self.imageView = imageView;
    
    //如果相对于原始图片，图片是缩小后显示的那么那么就让scrollView的最大放大比例为这个缩小的比例，并且让scollView支持缩放
    
    CGFloat maxScale = self.topic.width/imageView.zp_width;
    if(maxScale > 1){
        scrollView.maximumZoomScale = maxScale;
        scrollView.delegate = self;
    }
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

-(void)back{
    //退出viewController
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
    

}


@end
