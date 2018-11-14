//
//  NGNavigationBar.h
//  qianxunng
//
//  Created by lihuaqi on 2018/11/13.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UINavigationBar, UINavigationItem;

/**
 NavigationBar
 */
@interface NGNavigationBar : UIView
@property (nonatomic,assign) UIBarStyle barStyle;
@property (nonatomic,strong) UIColor *tintColor;
@property (nonatomic,strong) UIColor *barTintColor;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *shadowImageView;
///



/**
 NavigationItem
 */
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIView *titleView;

@property (nonatomic,copy) NSArray<UIButton *> *leftBarButtonItems;
@property (nonatomic,copy) NSArray<UIButton *> *rightBarButtonItems;
- (void)setLeftBarButtonItems:(NSArray<UIButton *> *)items animated:(BOOL)animated;
- (void)setRightBarButtonItems:(NSArray<UIButton *> *)items animated:(BOOL)animated;

@property(nonatomic, strong) UIButton *leftBarButtonItem;
@property(nonatomic, strong) UIButton *rightBarButtonItem;
- (void)setLeftBarButtonItem:(UIButton *)item animated:(BOOL)animated;
- (void)setRightBarButtonItem:(UIButton *)item animated:(BOOL)animated;
@end
