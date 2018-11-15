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

#endif /* NGMacro_h */
