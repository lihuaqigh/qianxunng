//
//  NGSearchBar.m
//  qianxunng
//
//  Created by lihuaqi on 2018/12/9.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGSearchBar.h"

@interface NGSearchBar() <UITextFieldDelegate>
@property (nonatomic, strong) UIImageView * searchImgV;
@property (nonatomic, strong) UITextField * textField;
@end

@implementation NGSearchBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        // 初始化参数
        _searchBarInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        _searchBarPlaceholder = @"搜索商品名或粘贴淘宝标题";
        _searchBarIcon = @"home_searchbar_icon_gray";
        _searchBarCenterPadding = 10;
        _searchBarAlignment = NGSearchBarAlignmentLeft;
        _searchBarRaidus = 15;
        _searchBarEditing = YES;
        
        // 创建搜索框内的左侧搜索标志
        _searchImgV = [[UIImageView alloc] init];
        _searchImgV.image = [UIImage imageNamed:_searchBarIcon];
        
        // 创建搜索框内的右侧文案
        _textField = [[UITextField alloc] init];
        _textField.placeholder = _searchBarPlaceholder;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.textAlignment = 0;
        _textField.backgroundColor = [UIColor clearColor];
        _textField.returnKeyType = UIReturnKeySearch;
        _textField.font = [UIFont ng_regularFontOfSize:14];
        _textField.textColor = RGB(6, 27, 40);
        _textField.delegate = self;
        
        [self addSubview:_searchImgV];
        [self addSubview:_textField];
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = _searchBarRaidus;
        self.backgroundColor = RGB(246, 246, 246);
        self.userInteractionEnabled = YES;
    }
    
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize iconSize = CGSizeMake(_searchImgV.image.size.width, _searchImgV.image.size.height);
    CGFloat iconCenterY = (self.height - iconSize.height) / 2;
    
    if (self.searchBarAlignment == NGSearchBarAlignmentLeft) {
        [_searchImgV setFrame:CGRectMake(_searchBarInsets.left, iconCenterY, iconSize.width, iconSize.height)];
        [_textField setFrame:CGRectMake(_searchImgV.right + _searchBarCenterPadding, 0, self.width - _searchImgV.right - _searchBarCenterPadding - _searchBarInsets.right, self.height)];
    } else {
        
//        [_searchImgV setFrame:CGRectMake(_searchBarInsets.left, self.centerY, iconSize.width, iconSize.height)];
//        [_textField setFrame:CGRectMake(_searchImgV.right + _searchBarCenterPadding, 0, self.width - _searchImgV.right - _searchBarCenterPadding - _searchBarInsets.right, self.height)];
    }
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (_searchBarEditing) {
        return YES;
    } else {
        return NO;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (_searchBarEditing) {
        UIView * view = [super hitTest:point withEvent:event];
        return view;
    } else {
        return self;
    }
}

@end
