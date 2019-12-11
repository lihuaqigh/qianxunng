//
//  NGNavigationBar.m
//  qianxunng
//
//  Created by lihuaqi on 2018/11/13.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGNavigationBar.h"
/// 导航左右按钮的中间间隔
static CGFloat const kBarButtonPadding = 0;

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
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.backgroundImageView];
    [self.backgroundImageView addSubview:self.shadowImageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.backgroundImageView setFrame:CGRectMake(0, 0, kScreenWidth, kNavigationHeight)];
    [self.shadowImageView setFrame:CGRectMake(0, kNavigationHeight - 0.5, kScreenWidth, 0.5)];
    
}

#pragma mark - setter/getter
/// titleView
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
    [self setTitleView:self.titleLabel];
}

- (void)setTitleView:(UIView *)titleView {
    [_titleView removeFromSuperview];
    _titleLabel = nil;
    _titleView = nil;
    
    if (titleView) {
        titleView.height = MIN(titleView.height, kNavigationBarHeight);
        titleView.centerX = self.centerX;
        titleView.y = (kNavigationBarHeight - titleView.height) / 2 + kStatusBarHeight;
        [self addSubview:titleView];
        _titleView = titleView;
    }
}

/// 左边按钮
- (void)setLeftBarButtonItem:(UIButton *)leftBarButtonItem {
    [self setLeftBarButtonItem:leftBarButtonItem animated:YES];
}

- (void)setLeftBarButtonItem:(UIButton *)item animated:(BOOL)animated {
    if (item) [self setLeftBarButtonItems:@[item] animated:animated];
}

- (void)setLeftBarButtonItems:(NSArray<UIButton *> *)leftBarButtonItems {
    [self setLeftBarButtonItems:leftBarButtonItems animated:YES];
}

- (void)setLeftBarButtonItems:(NSArray<UIButton *> *)items animated:(BOOL)animated {
    [_leftBarButtonItems makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _leftBarButtonItems = items;
    _leftBarButtonItem = nil;
    if (items.count == 1) {
        _leftBarButtonItem = [items lastObject];
    }
    
    @weakify(self)
    __block CGFloat left = 0;
    [items enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @strongify(self)
        // object frame
        obj.x = left;
        obj.height = MIN(obj.height, kNavigationBarHeight);
        obj.y = (kNavigationBarHeight - obj.height) / 2 + kStatusBarHeight;
        [self addSubview:obj];
        
        left = obj.right + kBarButtonPadding;
        
        // fead animated
        if (animated) {
            obj.alpha = 0.0;
            [UIView animateWithDuration:0.25 animations:^{
                obj.alpha = 1.0;
            }];
        } else {
            obj.alpha = 1.0;
        }
    }];
}

/// 右边按钮
- (void)setRightBarButtonItem:(UIButton *)rightBarButtonItem {
    [self setRightBarButtonItem:rightBarButtonItem animated:YES];
}

- (void)setRightBarButtonItem:(UIButton *)item animated:(BOOL)animated {
    if (item) [self setRightBarButtonItems:@[item] animated:animated];
}

- (void)setRightBarButtonItems:(NSArray<UIButton *> *)rightBarButtonItems {
    [self setRightBarButtonItems:rightBarButtonItems animated:YES];
}

- (void)setRightBarButtonItems:(NSArray<UIButton *> *)items animated:(BOOL)animated {
    [_rightBarButtonItems makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _rightBarButtonItems = items;
    _rightBarButtonItem = nil;
    if (items.count == 1) {
        _rightBarButtonItem = [items lastObject];
    }
    
    @weakify(self)
    __block CGFloat right = kScreenWidth;
    [items enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @strongify(self)
        // object frame
        obj.right = right;
        obj.height = MIN(obj.height, kNavigationBarHeight);
        obj.y = (kNavigationBarHeight - obj.height) / 2 + kStatusBarHeight;
        [self addSubview:obj];
        
        right = obj.left - kBarButtonPadding;
        
        // fead animated
        if (animated) {
            obj.alpha = 0.0;
            [UIView animateWithDuration:0.25 animations:^{
                obj.alpha = 1.0;
            }];
        } else {
            obj.alpha = 1.0;
        }
    }];
}

-(void)setTranslationY:(CGFloat)translationY {
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (CGFloat)translationY {
    return self.transform.ty;;
}

#pragma mark -懒加载
- (UIImageView *)backgroundImageView {
    if (_backgroundImageView == nil) {
        _backgroundImageView = [[UIImageView alloc] init];
    }
    return _backgroundImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth / 2, 44)];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    return _titleLabel;
}

- (UIImageView *)shadowImageView {
    if (_shadowImageView == nil) {
        _shadowImageView = [[UIImageView alloc] init];
        _shadowImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _shadowImageView.backgroundColor = kLineColor;
    }
    return _shadowImageView;
}
@end
