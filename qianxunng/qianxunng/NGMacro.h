//
//  NGMacro.h
//  qianxunng
//
//  Created by lihuaqi on 2018/11/16.
//  Copyright © 2018年 HQ. All rights reserved.
//

#ifndef NGMacro_h
#define NGMacro_h

/// 屏幕宽度
#define kScreenWidth            [UIScreen mainScreen].bounds.size.width
/// 屏幕高度
#define kScreenHeight            [UIScreen mainScreen].bounds.size.height
/// 是否是iPhoneX
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
/// 状态栏高度
#define kStatusBarHeight        (iPhoneX ? 44 : 20)
/// 导航栏高度
#define kNavigationBarHeight    44
/// 展示的导航的高度（导航+状态栏）
#define kNavigationHeight       (kStatusBarHeight + kNavigationBarHeight)
/// 底部 tabbar 高度
#define kTabBarHeight           (49 + (iPhoneX ? 34 : 0))
/// 颜色
#define RGB(x,y,z)              [UIColor colorWithRed:(x)/255.0 green:(y)/255.0 blue:(z)/255.0 alpha:1.0]
#define RGBA(x,y,z,a)           [UIColor colorWithRed:(x)/255.0 green:(y)/255.0 blue:(z)/255.0 alpha:a]

#endif /* NGMacro_h */
