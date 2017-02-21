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
        
        
        //加上工具条的高度
        _cellHeight+=35+ZPMargin;
        
        return _cellHeight;
        
    }



@end
