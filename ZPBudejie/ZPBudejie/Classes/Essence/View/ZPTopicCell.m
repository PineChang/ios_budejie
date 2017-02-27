//
//  ZPTopicCell.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/22.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ZPTopicCell.h"
#import "ZPTopic.h"
#import <UIImageView+WebCache.h>
//中间的控件
#import "ZPTopicPictureView.h"
#import "ZPTopicVideoView.h"
#import "ZPTopicVoiceView.h"

@interface ZPTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passtimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_label;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIView *topCmtView;
@property (weak, nonatomic) IBOutlet UILabel *topCmtLabel;

//中间要填充的控件
@property (nonatomic,weak) ZPTopicPictureView *pictureView;
@property (nonatomic,weak) ZPTopicVoiceView   *voiceView;
@property (nonatomic,weak) ZPTopicVideoView   *videoView;

@end


@implementation ZPTopicCell

#pragma mark - 懒加载
//懒加载这些中间的中间件
-(ZPTopicPictureView *)pictureView{
    if(!_pictureView){
        //从xib中加载这个类，不能直接alloc init
        ZPTopicPictureView * pictureView  = [ZPTopicPictureView zp_viewFromXib];
        //将这个pictureView添加进cell中的contentView；
        [self.contentView addSubview:pictureView];
        //并将成员属性指针也指向这个View
        _pictureView = pictureView;
        
    
    }
    return _pictureView;
}

-(ZPTopicVoiceView *)voiceView{
    if (!_voiceView) {
        ZPTopicVoiceView *voiceView = [ZPTopicVoiceView zp_viewFromXib];
        [self.contentView addSubview:voiceView];
        _voiceView = voiceView;
    }
    return _voiceView;
}

-(ZPTopicVideoView *)videoView{
    if (!_videoView) {
        ZPTopicVideoView *voiceView = [ZPTopicVideoView zp_viewFromXib];
        [self.contentView addSubview:voiceView];
        _videoView = _videoView;
    }
    return  _videoView;
}
//当创建这个cell的时候初始化工作
- (void)awakeFromNib {
    //给cell添加一个背景颜色；
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}
#pragma mask - 最终的自定义cell的frame信息存储在topic里面
//在模型中frame已经算好了
-(void)setFrame:(CGRect)frame{
    frame.size.height -=ZPMargin;
    [super setFrame:frame];
    
}
#pragma mask - 传进模型数据,重写setTopic方法；
-(void)setTopic:(ZPTopic *)topic{
    _topic = topic;
    
    //初始化cell中顶部的控件数据
    [self.profileImageView sd_setImageWithURL:topic.profile_image placeholderImage:topic.profile_image];
    self.nameLabel.text=topic.name;
    self.passtimeLabel.text=topic.passtime;
    self.text_label.text= topic.text;
    //将button上的文字设置为点赞量，转发量等
    [self setupButtonTitle:self.dingButton number:topic.ding placeholder:@"顶"];
    [self setupButtonTitle:self.caiButton number:topic.cai placeholder:@"踩"];
    [self setupButtonTitle:self.repostButton number:topic.repost placeholder:@"转发"];
    [self setupButtonTitle:self.commentButton number:topic.comment placeholder:@"评论"];
    //控制最热评论的显示与否
    if(topic.top_cmt.count){
        //有最热评论
        self.topCmtView.hidden=NO;
        NSDictionary *cmt = topic.top_cmt.firstObject;
        NSString *content = cmt[@"content"];
        if(content.length==0){
            content = @"[语音评论]";
            
        }
        NSString *username = cmt[@"user"][@"username"];
        self.topCmtLabel.text = [NSString stringWithFormat:@"%@:%@",username,content];
        
    }else{
        //没有最热评论的话，那么就将这个label隐藏；
    }
    
    // 最后设置中间的内容
    if (topic.type == ZPTopicTypePicture){//图片
        self.pictureView.hidden = NO;
        //当设置这句话的时候，就会触发picture中的set方法
        self.pictureView.topic = topic;
        self.voiceView.hidden = YES;
        self.videoView.hidden = YES;
    } else if (topic.type == ZPTopicTypeVoice) { // 声音
        self.pictureView.hidden = YES;
        self.voiceView.hidden = YES;
        self.voiceView.topic = topic;
        self.videoView.hidden = YES;
    } else if (topic.type == ZPTopicTypeVideo) { // 视频
        self.pictureView.hidden = YES;
        self.voiceView.hidden = YES;
        self.videoView.hidden = NO;
        self.videoView.topic = topic;
    } else if (topic.type == ZPTopicTypeWord) { // 段子
        self.pictureView.hidden = YES;
        self.voiceView.hidden = YES;
        self.videoView.hidden = YES;
    }
    
   


}
//对子控件进行布局
-(void) layoutSubviews{
    [super layoutSubviews];
    //将已经算好的frame赋值进去；
    if (self.topic.type ==  ZPTopicTypePicture) { // 图片
        self.pictureView.frame = self.topic.middleFrame;
    } else if (self.topic.type == ZPTopicTypeVoice) { // 声音
        self.voiceView.frame = self.topic.middleFrame;
    } else if (self.topic.type == ZPTopicTypeVideo) { // 视频
        self.videoView.frame = self.topic.middleFrame;
    }

}

- (void) setupButtonTitle:(UIButton *)button number:(NSInteger)number placeholder:(NSString *)placeholder{
    if (number>10000) {
        //如果结果数量大于一万，那么就将结果除以一万得到的小数，保留一位
        [button setTitle:[NSString stringWithFormat:@"%.1f万",number/10000.0] forState:UIControlStateNormal];
    }else if(number>0){
        [button setTitle:[NSString stringWithFormat:@"%zd",number] forState:UIControlStateNormal];
    }else{
        //如果结果数量等于0或者为nil 那么就直接显示文字顶即可；
        [button setTitle:placeholder forState:UIControlStateNormal];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
