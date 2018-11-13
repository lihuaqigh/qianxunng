//
//  UIViewController+Nav.h
//  qianxunng
//
//  Created by nangua on 2018/11/13.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGNavigationBar.h"

@interface UIViewController (Nav)

/// custom navigationBar
@property (nonatomic, strong) NGNavigationBar *navigationBar;
/// navigation title
@property (nonatomic, copy) NSString *ng_title;

@end
