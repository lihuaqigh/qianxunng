//
//  NGNavigationBar.m
//  qianxunng
//
//  Created by lihuaqi on 2018/11/13.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGNavigationBar.h"

@implementation NGNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
    self = [super initWithFrame:frame];
    if (self) {
//        _leftViews = [NSMutableArray arrayWithCapacity:0];
//        _rightViews = [NSMutableArray arrayWithCapacity:0];
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1];
}
@end
