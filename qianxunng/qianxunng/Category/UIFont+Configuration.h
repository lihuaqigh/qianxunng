//
//  UIFont+Configuration.h
//  qianxunng
//
//  Created by nangua on 2018/11/15.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Configuration)
/**
 苹方-简 常规体
 font-family: PingFangSC-Regular, sans-serif;
 */
+ (UIFont *)ng_regularFontOfSize:(CGFloat)size;

/**
 苹方-简 中黑体
 font-family: PingFangSC-Medium, sans-serif;
 */
+ (UIFont *)ng_mediumFontOfSize:(CGFloat)size;

/**
 苹方-简 中粗体
 font-family: PingFangSC-Semibold, sans-serif;
 */
+ (UIFont *)ng_semiboldFontOfSize:(CGFloat)size;

/**
 不常用字体使用这个方法管理
 */
+ (UIFont *)ng_fontWithName:(NSString *)fontName size:(CGFloat)fontSize;

//苹方-简 极细体
//font-family: PingFangSC-Ultralight, sans-serif;
//苹方-简 细体
//font-family: PingFangSC-Light, sans-serif;
//苹方-简 纤细体
//font-family: PingFangSC-Thin, sans-serif;

@end
