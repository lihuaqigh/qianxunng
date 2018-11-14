//
//  NGNavigationBar.m
//  qianxunng
//
//  Created by lihuaqi on 2018/11/13.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGNavigationBar.h"

/// 屏幕宽度
#define kScreenWidth            [UIScreen mainScreen].bounds.size.width
/// 是否是iPhoneX
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
/// 状态栏高度
#define kStatusBarHeight        (iPhoneX ? 44 : 20)
/// 导航栏高度
#define kNavigationBarHeight    44
/// 展示的导航的高度（导航+状态栏）
#define kNavigationHeight       (kStatusBarHeight + kNavigationBarHeight)

@interface NGNavigationBar()

@property (nonatomic, strong) UILabel     *titleLabel;

@end

@implementation NGNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    frame = CGRectMake(0, 0, kScreenWidth, kNavigationHeight);
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.titleLabel];
    [self.backgroundImageView addSubview:self.shadowImageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.backgroundImageView setFrame:CGRectMake(0, 0, kScreenWidth, kNavigationHeight)];
    [self.titleLabel setFrame:CGRectMake(0, kStatusBarHeight, kScreenWidth, kNavigationBarHeight)];
    [self.shadowImageView setFrame:CGRectMake(0, kNavigationHeight - 0.5, kScreenWidth, 0.5)];
    
}

#pragma mark - setter
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setTitleView:(UIView *)titleView {
    _titleView = titleView;
}

/// 左边按钮
- (void)setLeftBarButtonItem:(UIButton *)leftBarButtonItem {
    _leftBarButtonItem = leftBarButtonItem;
    [self setLeftBarButtonItems:@[leftBarButtonItem]];
}

- (void)setLeftBarButtonItems:(NSArray<UIButton *> *)leftBarButtonItems {
    _leftBarButtonItems = leftBarButtonItems;
    [self setLeftBarButtonItems:leftBarButtonItems animated:YES];
}

- (void)setLeftBarButtonItems:(NSArray<UIButton *> *)items animated:(BOOL)animated {
    
}

/// 右边按钮
- (void)setRightBarButtonItem:(UIButton *)rightBarButtonItem {
    _rightBarButtonItem = rightBarButtonItem;
    [self setRightBarButtonItems:@[rightBarButtonItem]];
}

- (void)setRightBarButtonItems:(NSArray<UIButton *> *)rightBarButtonItems {
    _rightBarButtonItems = rightBarButtonItems;
    [self setRightBarButtonItems:rightBarButtonItems animated:YES];
}

- (void)setRightBarButtonItems:(NSArray<UIButton *> *)items animated:(BOOL)animated {
    
}



#pragma mark - getter

- (UIImageView *)backgroundImageView {
    if (_backgroundImageView == nil) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0 green:arc4random_uniform(256.0)/256.0 blue:arc4random_uniform(256.0)/256.0 alpha:1];
    }
    return _backgroundImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIImageView *)shadowImageView {
    if (_shadowImageView == nil) {
        _shadowImageView = [[UIImageView alloc] init];
        _shadowImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _shadowImageView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0 green:arc4random_uniform(256.0)/256.0 blue:arc4random_uniform(256.0)/256.0 alpha:1];
    }
    return _shadowImageView;
}
@end
