//
//  SQBackgroundLabelView.m
//  pro
//
//  Created by nangua on 2019/7/2.
//  Copyright © 2019 SQKB. All rights reserved.
//

#import "SQBackgroundLabelView.h"

@interface SQBackgroundLabelView ()
@property (nonatomic, strong) UIImageView *backgroundView;
@property (nonatomic, strong) UILabel *titleLb;
@end


@implementation SQBackgroundLabelView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    [self addSubview:self.backgroundView];
    
    [self.backgroundView addSubview:self.titleLb];
    
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.backgroundView).mas_offset(UIEdgeInsetsMake(0, 5, 0, 5));
    }];
}

// 加圆角
- (void)addRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii {
    [self addRoundingCorners:corners cornerRadii:cornerRadii layerFrame:self.bounds];
}

- (void)addRoundingCorners:(UIRectCorner)corners
               cornerRadii:(CGSize)cornerRadii
                layerFrame:(CGRect)layerFrame {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:layerFrame byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.frame = layerFrame;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

// 加渐变色
- (void)addGradientWithStartPoint:(CGPoint)startPoint
                         endPoint:(CGPoint)endPoint
                           colors:(NSArray *)colors
                        locations:(NSArray <NSNumber *>*)locations {
    CAGradientLayer *gradientLayer = (CAGradientLayer *)self.layer;
    if (colors.count > 0) gradientLayer.colors = colors;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    if (locations.count > 0) gradientLayer.locations = locations;
}

+ (Class)layerClass {
    return [CAGradientLayer class];
}

#pragma mark - setter
- (void)setLabelInsets:(UIEdgeInsets)labelInsets {
    _labelInsets = labelInsets;
    [self.titleLb mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(labelInsets);
    }];
}

- (void)setLabelText:(NSString *)labelText {
    _labelText = labelText;
    self.titleLb.text = labelText;
}

- (void)setLabelAttributedText:(NSAttributedString *)labelAttributedText {
    _labelAttributedText = labelAttributedText;
    self.titleLb.attributedText = labelAttributedText;
}

- (void)setLabelFont:(UIFont *)labelFont {
    _labelFont = labelFont;
    self.titleLb.font = labelFont;
}

- (void)setLabelTextColor:(UIColor *)labelTextColor {
    _labelTextColor = labelTextColor;
    self.titleLb.textColor = labelTextColor;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    if (!backgroundImage) {
        return;
    }
    _backgroundImage = backgroundImage;
    
    self.backgroundView.image = backgroundImage;
}

#pragma mark - Getter/Lazzy
- (UIImageView *)backgroundView {
    if (_backgroundView == nil) {
        _backgroundView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _backgroundView;
}

- (UILabel *)titleLb {
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.textColor = [UIColor whiteColor];
    }
    return _titleLb;
}
@end
