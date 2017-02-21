//
//  ZPHTTPSessionManager.m
//  ZPBudejie
//
//  Created by 管理员 on 2017/2/21.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ZPHTTPSessionManager.h"

@implementation ZPHTTPSessionManager
-(instancetype) initWithBaseURL:(NSURL *)url sessionConfiguration:(nullable NSURLSessionConfiguration *)configuration{
    if(self = [super initWithBaseURL:url sessionConfiguration:configuration]){
        //设置操作请求的请求header
        [self.requestSerializer setValue:[UIDevice currentDevice].model  forHTTPHeaderField:@"Phone"];
        [self.requestSerializer setValue:[UIDevice currentDevice].systemVersion     forHTTPHeaderField:@"OS"];
    }
    
    return self;
}
@end
