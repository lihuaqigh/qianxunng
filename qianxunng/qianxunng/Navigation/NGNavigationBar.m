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
@property (nonatomic, strong) UIView      *titleView;
@property (nonatomic, strong) UIButton    *leftButton;
@property (nonatomic, strong) UIButton    *rightButton;
@property (nonatomic, strong) UIView      *bottomLine;
@property (nonatomic, strong) UIView      *backgroundView;
@property (nonatomic, strong) UIImageView *backgroundImageView;

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
    self.backgroundColor = [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1];
    [self addSubview:self.titleLabel];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel setFrame:CGRectMake(0, kStatusBarHeight, kScreenWidth, kNavigationBarHeight)];
    
}

#pragma mark - setter
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

#pragma mark - 懒加载
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
@end
