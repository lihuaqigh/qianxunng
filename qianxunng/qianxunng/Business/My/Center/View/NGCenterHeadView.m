//
//  NGCenterHeadView.m
//  qianxunng
//
//  Created by lihuaqi on 2019/9/16.
//  Copyright © 2019 HQ. All rights reserved.
//

#import "NGCenterHeadView.h"

@interface NGCenterHeadView()
@property (nonatomic, strong) UIImageView *iconImgV;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation NGCenterHeadView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.height = [NGCenterHeadView headHeight];
    self.width = kScreenWidth;
    self.backgroundColor = RGB(254, 230, 77);
    
    [self addSubview:self.iconImgV];
    [self addSubview:self.nameLabel];
    
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

- (void)refreshUI {
    @weakify(self)
    [[NGLoginManager sharedManager] checkLoginStatusWithCompletion:^(BOOL success) {
        @strongify(self)
        if (success ) {
            NGUser *user = [NGLoginManager sharedManager].user;
            [self.iconImgV sd_setImageWithURL:[NSURL URLWithString:user.icon]];
            self.nameLabel.text = user.name;
        } else {
            
        }
    }];
    
}

+ (CGFloat)headHeight1 {
    CGFloat h1 = NGHeight812For2339(575);
    return h1;
}

+ (CGFloat)headHeight2 {
    CGFloat h2 = NGHeight812For2339(175);
    return h2;
}

+ (CGFloat)headHeight {
    return [self headHeight1] + [self headHeight2];
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
