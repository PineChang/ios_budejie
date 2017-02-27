//
//  ZPTopicVideoView.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/25.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ZPTopicVideoView.h"

@interface ZPTopicVideoView()
@property (weak, nonatomic) IBOutlet UIImageView *placeholderView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playcountLabel;
@property (weak, nonatomic) IBOutlet UILabel *videotimeLabel;


@end

@implementation ZPTopicVideoView
-(void)awakeFromNib{
    //将autoresizing关闭；
    self.autoresizingMask = UIViewAutoresizingNone;
    //将imageView中的用户交互打开；默认是没有用户交互的
    self.imageView.userInteractionEnabled = YES;
    //当点击imageView的时候就直接看大图；
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seeBigPicture)] ];
}
//当点击某个cell的图片，视频或者，音频的时候，查看详细内容的viewController；
//此时应该讲这个topic数据传递进去
-(void)seeBigPicture{
    
}

-(void)setTopic:(ZPTopic *)topic{
    _topic  = topic ;
    self.placeholderView.hidden = NO;
    self.imageView zp_set
}

@end
