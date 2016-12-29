//
//  UIImage+Image.h
//  ZPBudejie
//
//  Created by 管理员 on 2016/12/29.
//  Copyright © 2016年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIImage(Image)

+(instancetype) imageOriginalWithName:(NSString *)imageName;

-(instancetype) zp_circleImage;

+(instancetype) zp_circleImageNamed:(NSString *)name;


@end
