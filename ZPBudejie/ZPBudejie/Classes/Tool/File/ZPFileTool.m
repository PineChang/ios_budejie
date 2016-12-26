//
//  ZPFileTool.m
//  ZPBudejie
//
//  Created by 管理员 on 2016/12/26.
//  Copyright © 2016年 com. All rights reserved.
//

#import "ZPFileTool.h"

@implementation ZPFileTool

//
+(void)getFileSize:(NSString *)directoryPath completion:(void (^)(NSInteger))completion{
    
    //第一步要获取文件管理者
    NSFileManager *mgr  = [NSFileManager defaultManager];
    //判断是否是文件的逻辑
    BOOL isDirectory;
    //先判断是否文件存在,并能继续判断是不是文件夹还是文件
    BOOL isExit =[mgr  fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    //如果不存在或者不是文件夹，那么直接报错
    if(!isExit || !isDirectory){
        NSException *excp = [NSException exceptionWithName:@"path error" reason:@"请传入存在的文件夹路径" userInfo:nil];
        [excp raise];
    };
    //以下异步操作获取文件夹下的路径，并且计算其大小
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //获取文件下面的所有路径，包括直接和非直接后代；
        NSArray * subPaths = [mgr subpathsAtPath:directoryPath];
        //记录subpath下的文件总大小
        NSInteger totalSize = 0;
        
        for (NSString *subpath in subPaths) {
            //因为获取到的路径只是从传进来的路径算起，所以要想获得全路径必须要拼接传进来的路径
            NSString *filePath = [directoryPath stringByAppendingPathComponent:subPaths];
            
            //判断是否是隐藏文件，如果是那么直接忽略；
            if([filePath containsString:@".DS"]) continue;
            
            //判断文件是否存在，并判断是否是文件夹；
            BOOL isDirectory;
            BOOL isExit = [mgr fileExistsAtPath:filePath isDirectory:&isDirectory];
            if(!isDirectory||isDirectory) continue;
            //如果遍历得到的文件不是文件夹也的确存在，那么获取文件在这个路径的文件字典属性
            NSDictionary *attr = [mgr attributesOfItemAtPath:filePath error:nil];
            //获取字典属性中的文件尺寸属性
            NSInteger fileSize = [attr fileSize];
            
            //进行累加
            totalSize +=fileSize;
            
        }
        //计算完成后，回到主线程，执行回调block
        dispatch_sync(dispatch_get_main_queue(),^{
            if(completion){
                completion(totalSize);
            }
        });
        
        
    });
    
}
//给一个文件夹路径删除此文件夹下的所有文件
+(void)removeDirectoryPath:(NSString *)directoryPath{
    //拿到文件管理器
    NSFileManager *mgr =[NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL isExist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if(!isExist||!isDirectory){
       NSException *excep =  [NSException exceptionWithName:@"path error" reason:@"请传入一个已经存在的文件夹目录" userInfo:nil];
        
        [excep raise];
        
    }
    //如果文件存在并且是文件夹,获取传递进来的文件夹下的所有直接子路径包括文件夹路径
    NSArray *filePaths = [mgr contentsOfDirectoryAtPath:directoryPath error:nil];
    for (NSString*subPath in filePaths) {
        NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
        //此时拿到路径后直接删除
        [mgr removeItemAtPath:filePath error:nil];
        
    }
    
}
@end
