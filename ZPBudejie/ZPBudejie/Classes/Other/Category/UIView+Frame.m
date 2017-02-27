//
//  UIView+Frame.m
//  ZPBudejie
//
//  Created by 管理员 on 2016/12/29.
//  Copyright © 2016年 com. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView(Frame)

-(void)setZp_width:(CGFloat)zp_width{
    CGRect rect = self.frame;
    rect.size.width = zp_width;
    self.frame = rect;
}

-(CGFloat)zp_width{
    return self.frame.size.width;
}

-(void)setZp_height:(CGFloat)zp_height{
    CGRect rect = self.frame;
    rect.size.height = zp_height;
    self.frame = rect;
}

-(CGFloat)zp_height{
    return self.frame.size.height;
}

-(void)setZp_x:(CGFloat)zp_x{
    CGRect rect = self.frame;
    rect.origin.x = zp_x;
    self.frame = rect;
}
-(CGFloat)zp_x{
    return self.frame.origin.x;
}

-(void)setZp_y:(CGFloat)zp_y{
    CGRect rect = self.frame;
    rect.origin.y=zp_y;
    self.frame = rect;
}

-(void)setZp_centerX:(CGFloat)zp_centerX{
    CGPoint center = self.center;
    center.x = zp_centerX;
    self.center=center;
}
-(CGFloat)zp_centerX{
    return self.center.x;
}

-(void)setZp_centerY:(CGFloat)zp_centerY{
    CGPoint center = self.center;
    center.y=zp_centerY;
    self.center = center;
}
-(CGFloat)zp_centerY{
    return self.center.y;
}
+ (instancetype) zp_viewFromXib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}
@end
