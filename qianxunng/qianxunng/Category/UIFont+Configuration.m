//
//  UIFont+Configuration.m
//  qianxunng
//
//  Created by nangua on 2018/11/15.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "UIFont+Configuration.h"

@implementation UIFont (Configuration)

+ (UIFont *)ng_regularFontOfSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    if (!font) {
        if (@available(iOS 8.2, *)) {
            font = [UIFont systemFontOfSize:size weight:UIFontWeightRegular];
        } else {
            font = [UIFont systemFontOfSize:size];
        }
    }
    return font;
}

+ (UIFont *)ng_mediumFontOfSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    if (!font) {
        if (@available(iOS 8.2, *)) {
            font = [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
        } else {
            font = [UIFont systemFontOfSize:size];
        }
    }
    return font;
}

+ (UIFont *)ng_semiboldFontOfSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
    if (!font) {
        if (@available(iOS 8.2, *)) {
            font = [UIFont systemFontOfSize:size weight:UIFontWeightSemibold];
        } else {
            font = [UIFont systemFontOfSize:size];
        }
    }
    return font;
}

+ (UIFont *)ng_fontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    if (!font) font = [UIFont systemFontOfSize:fontSize];
    return font;
}

@end
