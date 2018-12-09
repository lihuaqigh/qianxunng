//
//  NGBaseController.h
//  qianxunng
//
//  Created by nangua on 2018/11/12.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NGNavigationBar.h"

//@class NGNavigationBar;

@interface NGBaseController : UIViewController
/// custom navigationBar
@property (nonatomic, strong) NGNavigationBar *navigationBar;

@property (nonatomic, assign) CGFloat navBarAlpha;

@property (nonatomic, assign) CGFloat navBarBackgroundAlpha;

@property (nonatomic, assign) BOOL backButtonHidden;

@end
