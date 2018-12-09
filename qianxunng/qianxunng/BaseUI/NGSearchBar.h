//
//  NGSearchBar.h
//  qianxunng
//
//  Created by lihuaqi on 2018/12/9.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NGSearchBarAlignment) {
    NGSearchBarAlignmentLeft = 0,
    NGSearchBarAlignmentCenter = 1,
};

@interface NGSearchBar : UIView

/// 搜索框布局类型
@property (nonatomic, assign) NGSearchBarAlignment searchBarAlignment;
/// 搜索框背景圆角大小
@property (nonatomic, assign) CGFloat searchBarRaidus;
/// insets
@property (nonatomic, assign) UIEdgeInsets searchBarInsets;
/// centerPadding
@property (nonatomic, assign) CGFloat searchBarCenterPadding;

@property (nonatomic, copy) NSString *searchBarPlaceholder;

@property (nonatomic, copy) NSString *searchBarIcon;
/// 搜索框是否能够编辑
@property (nonatomic, assign) BOOL searchBarEditing;

@end
