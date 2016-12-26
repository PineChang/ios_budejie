//
//  ZPFileTool.h
//  ZPBudejie
//
//  Created by 管理员 on 2016/12/26.
//  Copyright © 2016年 com. All rights reserved.
//
/*程序中的网络处理，文件管理，缓存处理一般需要抽取为业务类*/
#import <Foundation/Foundation.h>


/*以下为抽取的文件管理的业务类*/
@interface ZPFileTool : NSObject

/**
 以下为抽取的给一个文件夹的路径，就能拿到这个文件夹中的文件大小总和,并吧计算的结果回调给block
 */
+(void)getFileSize:(NSString*)directoryPath completion:(void(^)(NSInteger))completion;

/*删除文件夹中的所有文件*/


+(void)removeDirectoryPath:(NSString*)directoryPath;
@end
