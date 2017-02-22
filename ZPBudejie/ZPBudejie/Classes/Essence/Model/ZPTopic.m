//
//  ZPTopic.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/21.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ZPTopic.h"

@implementation ZPTopic

//重写获取cellHeight的方法
-(CGFloat)cellHeight{
    //如果cellHeight有值，说明计算过了，直接将其返回即可
    if(_cellHeight) return _cellHeight;
    //cellHeight加上头部的高度，也是文字的Y值；
    _cellHeight +=55;
    
    //cell中发表看法的部分文字的高度，
    //第一知道了文字部分的宽度为ZPScreenW-2*ZPMargin
    CGSize  textMaxSize = CGSizeMake(ZPScreenW-2*ZPMargin, MAXFLOAT);
    //第二知道了每一个文字的大小为15；//那么就能推算出这部分文字如果要显示的话能撑开的高度；
    _cellHeight += [self.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:15]} context:nil].size.height +ZPMargin;
    //加上评论的高度
    if(self.top_cmt.count){//如果有最热评论
    //评论的标题
        _cellHeight +=21;
    //每条评论的内容，取第一条就是最热的评论
        NSDictionary *cmt  = self.top_cmt.firstObject;
        
     //评论username
        NSString *username = cmt[@"user"][@"username"];
     //评论的内容
        
        NSString *content = cmt[@"content"];
        if(content.length==0){
            content = @"[语音评论]";
        }
        
    //评论的username+内容
        NSString *cmtText = [NSString stringWithFormat:@"%@:%@",username,content];
        
    //对评论的username+内容计算高度
        _cellHeight +=[cmtText boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height+ZPMargin;
        
    }
    
    //如果中间有图片，声音，视频，那么他们的宽为屏幕的宽
    //减去两边的margin，高统一为根据宽度等比例伸缩后的高
    if(self.type != ZPTopicTypeWord){
        //中间部分的宽度
        CGFloat middleW = textMaxSize.width;
        //中间部分的高度
        CGFloat middleH = middleW * self.height/self.width;
        
        //有可能图片非常的长，那么即使经过等比例伸缩后，其长度超过了屏幕的高度，那么经过如下处理
        if(middleH >=ZPScreenH){
            //如果高度高于屏幕的高度那么就指定为200；
            middleH = 200;
            //并将其设置为大图
            self.bigPicture = YES;
            
        }
        
        CGFloat middleY = _cellHeight;
        CGFloat middleX = ZPMargin;
        
        //此时，中间的内容的frame为
        self.middleFrame = CGRectMake(middleX, middleY, middleW, middleH);
        
        //此时加上中间的高度，那么cellheight为
        
        _cellHeight += middleH +ZPMargin;
        
        
        
    }
        //加上下面点赞评论等区域bar的高度
        _cellHeight+=35+ZPMargin;
        
        return _cellHeight;
        
    }



@end
