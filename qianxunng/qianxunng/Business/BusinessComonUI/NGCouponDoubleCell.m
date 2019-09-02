//
//  NGCouponDoubleCell.m
//  qianxunng
//
//  Created by lihuaqi on 2019/9/2.
//  Copyright © 2019 HQ. All rights reserved.
//

#import "NGCouponDoubleCell.h"
#import "SQBackgroundLabelView.h"

@interface NGCouponDoubleCell ()
@property (nonatomic, strong) UIImageView *productImageView;
@property (nonatomic, strong) UIImageView *vTagImgV;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *finalPreLabel;
@property (nonatomic, strong) UILabel *finalPriceLabel;
@property (nonatomic, strong) UILabel *salesLabel;
/// 个性化描述label
//@property (nonatomic, strong) UILabel *rankDescLabel;
/// 券
@property (nonatomic, strong) SQBackgroundLabelView *redLabel;
/// 返利
@property (nonatomic, strong) SQBackgroundLabelView *whiteLabel;
@end


@implementation NGCouponDoubleCell


#pragma mark - ********************** View Lifecycle **********************

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self regNotification];
        
        [self initVariable];
        
        [self setupViews];
    }
    
    return self;
}

#pragma mark - ********************** Init All Views **********************

- (void)initVariable {
    
}

- (void)setupViews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 7;
    
    [self.contentView addSubview:self.productImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.finalPreLabel];
    [self.contentView addSubview:self.finalPriceLabel];
    [self.contentView addSubview:self.salesLabel];
    [self.contentView addSubview:self.redLabel];
    [self.contentView addSubview:self.whiteLabel];
    
    //
    CGFloat cellW = (kScreenWidth - 20 - 7) / 2.0;
    CGFloat padding = 10;
    // 券和返利
    CGFloat trBottom = 33, trH = 17;
    
    [self.productImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(cellW, cellW));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.productImageView.mas_bottom).mas_equalTo(8);
        make.left.mas_equalTo(self.contentView.mas_left).mas_equalTo(padding);
        make.right.mas_equalTo(self.contentView.mas_right).mas_equalTo(-padding);
    }];
    
    [self.finalPreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_equalTo(-7);
        make.left.mas_equalTo(self.contentView.mas_left).mas_equalTo(padding);
    }];

    [self.finalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.finalPreLabel.mas_bottom).mas_equalTo(3);
        make.left.mas_equalTo(self.finalPreLabel.mas_right).mas_equalTo(0);
    }];

    [self.salesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.finalPreLabel.mas_bottom).mas_equalTo(-1);
        make.right.mas_equalTo(self.contentView.mas_right).mas_equalTo(-10);
    }];

    [self.redLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_equalTo(-trBottom);
        make.left.mas_equalTo(self.contentView.mas_left).mas_equalTo(padding);
        make.height.mas_equalTo(trH);
    }];

    [self.whiteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.redLabel.mas_top);
        make.left.mas_equalTo(self.redLabel.mas_right).mas_equalTo(4);
        make.height.mas_equalTo(self.redLabel.mas_height);
    }];
}

/**
 TODO: 注册通知
 */
- (void)regNotification {
    
}


#pragma mark - ******************************************* 对外方法 **********************************

- (void)refreshUI {
    _titleLabel.text = @"悠珂思 透明持久口红雨衣唇膏商是佳都科技";
    _redLabel.labelText = @"100元券";
    _whiteLabel.labelText = @"现金红包";
    _finalPriceLabel.text = @"58.98";
    _salesLabel.text = @"1.2万人付款";
}

#pragma mark - ******************************************* 私有方法 **********************************

- (void)_privateFuncDemo {
    
}

#pragma mark - ******************************************* 基类方法(一般发生在重写函数) ****************


- (void)layoutSubviews {
    [super layoutSubviews];
    [self refreshUI];
}


#pragma mark - ********************** Button Touch Event **********************

- (void)btnClickDemo:(UIButton *)sender {
    
}

#pragma mark - ********************** Delegate Event **********************

#pragma mark - 代理 demo


#pragma mark - ******************************************* Net Connection Event ********************

#pragma mark - 请求 demo

- (void)req_URL_FromViewModel {
    
}


#pragma mark - ********************** Notification Event **********************

#pragma mark - 通知 demo

- (void)notification_demo:(NSNotification *)aNotification {
    
}

#pragma mark - ******************************************* 属性变量的 Set 和 Get 方法 *****************
- (UIImageView *)productImageView {
    if (_productImageView == nil) {
        _productImageView = [[UIImageView alloc] init];
        _productImageView.contentMode = UIViewContentModeScaleAspectFill;
        _productImageView.backgroundColor = [UIColor lightGrayColor];
    }
    return _productImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = [UIFont ng_regularFontOfSize:14];
        _titleLabel.textColor = kTitleColor;
    }
    return _titleLabel;
}

- (UILabel *)finalPreLabel {
    if (!_finalPreLabel) {
        _finalPreLabel = [[UILabel alloc] init];
        _finalPreLabel.textColor = RGB(255, 34, 32);
        _finalPreLabel.font = [UIFont ng_regularFontOfSize:12];
        _finalPreLabel.text = @"￥";
    }
    return _finalPreLabel;
}

- (UILabel *)finalPriceLabel {
    if (!_finalPriceLabel) {
        _finalPriceLabel = [[UILabel alloc] init];
        _finalPriceLabel.textColor = RGB(255, 59, 31);
        _finalPriceLabel.font = [UIFont ng_semiboldFontOfSize:19];
    }
    return _finalPriceLabel;
}

- (UILabel *)salesLabel {
    if (!_salesLabel) {
        _salesLabel = [[UILabel alloc] init];
        _salesLabel.textColor = RGB(132, 141, 148);
        _salesLabel.font = [UIFont ng_regularFontOfSize:12];
    }
    return _salesLabel;
}

- (SQBackgroundLabelView *)redLabel {
    if (!_redLabel) {
        _redLabel = [SQBackgroundLabelView new];
        _redLabel.layer.cornerRadius = 2;
        _redLabel.layer.masksToBounds = YES;
        _redLabel.labelTextColor = [UIColor whiteColor];
        _redLabel.labelFont = [UIFont ng_mediumFontOfSize:12];
        [_redLabel addGradientWithStartPoint:CGPointMake(0.01, 0.01) endPoint:CGPointMake(0.99, 1.01) colors:@[(__bridge id)[UIColor colorWithRed:255/255.0 green:120/255.0 blue:47/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:255/255.0 green:31/255.0 blue:31/255.0 alpha:1.0].CGColor] locations:@[@(0), @(1.0f)]];
    }
    return _redLabel;
}

- (SQBackgroundLabelView *)whiteLabel {
    if (!_whiteLabel) {
        _whiteLabel = [SQBackgroundLabelView new];
        _whiteLabel.layer.cornerRadius = 2;
        _whiteLabel.layer.masksToBounds = YES;
        _whiteLabel.layer.borderWidth = 1;
        _whiteLabel.layer.borderColor = RGB(255, 90, 36).CGColor;
        _whiteLabel.backgroundColor = RGB(255, 244, 242);
        _whiteLabel.labelTextColor = RGB(255, 91, 42);
        _whiteLabel.labelFont = [UIFont ng_mediumFontOfSize:12];
    }
    return _whiteLabel;
}
@end
