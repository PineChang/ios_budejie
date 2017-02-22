//
//  ZPTopic.h
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/21.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
//oc中第一个是枚举项的数据类型，第二个位枚举类型
typedef NS_ENUM(NSUInteger,ZPTopicType){
    ZPTopicTypeAll = 1,
    ZPTopicTypePicture = 10,
    ZPTopicTypeWord = 29,
    ZPTopicTypeVoice = 31,
    ZPTopicTypeVideo = 41
};

@interface ZPTopic : NSObject
//cell中头部的一些数据
@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *profile_image;

@property(nonatomic,copy) NSString *text;

@property(nonatomic,copy) NSString *passtime;

//cell尾部的一些数据

@property(nonatomic,assign) NSInteger ding;
@property(nonatomic,assign) NSInteger  cai;
@property(nonatomic,assign) NSInteger  repost;
@property(nonatomic,assign) NSInteger comment;


//帖子的评论
@property(nonatomic,strong) NSArray *top_cmt;

//帖子的类型

@property(nonatomic,assign) NSInteger type;

//帖子内容的宽度和高度(仅仅指服务器发过来的图片，声音，视频等的高度，未经任何加工）不包括文字；
@property(nonatomic,assign) NSInteger width;
@property(nonatomic,assign) NSInteger height;
//---------------图片类的属性-----------------//
//小图，中图，大图的url

@property(nonatomic,copy) NSString *image0;
@property(nonatomic,copy) NSString *image1;
@property(nonatomic,copy) NSString *image2;

//是否为动图

@property(nonatomic,assign) BOOL is_gif;

//-------------音视频的属性----------------//
//音频或者视频的时长
@property(nonatomic,assign) NSInteger voiceTime;
@property(nonatomic,assign) NSInteger videoTime;
//音视频的播放次数
@property(nonatomic,assign) NSInteger playcount;

//-------以下为根据模型计算出来的属性，并非为服务器返回的数据
// 仅仅为了方便
//cell的高度
@property(nonatomic,assign) CGFloat cellHeight;
//中间内容的高度
@property(nonatomic,assign) CGRect middleFrame;

//是否为超长图片
@property(nonatomic,assign,getter=isBigPicture) BOOL bigPicture;

@end
