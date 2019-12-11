//
//  NGMyCenterHeadCell.m
//  qianxunng
//
//  Created by lihuaqi on 2019/9/16.
//  Copyright © 2019 HQ. All rights reserved.
//

#import "NGMyCenterHeadCell.h"

@interface NGMyCenterHeadCell()
@property (nonatomic, strong) UIImageView *iconImgV;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation NGMyCenterHeadCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.iconImgV];
    [self.contentView addSubview:self.nameLabel];
    
    [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(75, 75));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.iconImgV.mas_centerY);
        make.left.mas_equalTo(self.iconImgV.mas_right).mas_equalTo(10);
    }];
}

- (void)setModel:(NGUser *)model {
    _model = model;
    [self.iconImgV sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    self.nameLabel.text = model.name;
}

- (UIImageView *)iconImgV {
    if (_iconImgV == nil) {
        _iconImgV = [[UIImageView alloc] init];
        _iconImgV.backgroundColor = [UIColor grayColor];
        _iconImgV.layer.masksToBounds = YES;
        _iconImgV.layer.cornerRadius = 75 / 2.0;
    }
    return _iconImgV;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont ng_regularFontOfSize:14];
        _nameLabel.text = @"未登录";
    }
    return _nameLabel;
}
@end
