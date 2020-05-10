//
//  UIView+Frame.m
//  qianxunng
//
//  Created by lihuaqi on 2020/4/4.
//  Copyright © 2020 HQ. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
CGFloat NGHeight812For2339(CGFloat value) {
    CGFloat height = value * 812 / 2339;
    return ceil(height);
}

CGFloat NGWidth375For1080(CGFloat value) {
    CGFloat width = value * 375 / 1080;
    return ceil(width);
}
@end
