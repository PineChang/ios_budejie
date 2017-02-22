//
//  ZPTopicViewController.h
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/21.
//  Copyright © 2017年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZPTopic.h"//里面有帖子的枚举


//这个TopicView是所有的图片，视频，文字，声音的父控制器；
@interface ZPTopicViewController : UITableViewController
//获取帖子的类型
-(ZPTopicType) type;
@end
