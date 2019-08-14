//
//  SQBackgroundLabelView.h
//  pro
//
//  Created by nangua on 2019/7/2.
//  Copyright © 2019 SQKB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQBackgroundLabelView : UIView
/// 文字内边距
@property (nonatomic, assign) UIEdgeInsets labelInsets;
/// 文字字体
@property (nonatomic, strong) UIFont *labelFont;
/// 文字颜色
@property (nonatomic, strong) UIColor *labelTextColor;
/// 文本
@property (nonatomic, copy) NSString *labelText;
/// 富文本
@property (nonatomic, copy) NSAttributedString *labelAttributedText;

/// 容器背景
@property (nonatomic, strong) UIImage *backgroundImage;

/// 容器加圆角,注意自动布局的时候控件自身frame获取延迟的问题。
- (void)addRoundingCorners:(UIRectCorner)corners
               cornerRadii:(CGSize)cornerRadii;

/// 容器加圆角
- (void)addRoundingCorners:(UIRectCorner)corners
               cornerRadii:(CGSize)cornerRadii
                layerFrame:(CGRect)layerFrame;

/// 容器加渐变色
- (void)addGradientWithStartPoint:(CGPoint)startPoint
                         endPoint:(CGPoint)endPoint
                           colors:(NSArray *)colors
                        locations:(NSArray <NSNumber *>*)locations;
@end

NS_ASSUME_NONNULL_END
