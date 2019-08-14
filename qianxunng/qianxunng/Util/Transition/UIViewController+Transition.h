//
//  UIViewController+Transition.h
//  IGListDemo
//
//  Created by nangua on 2019/8/11.
//  Copyright © 2019 lhq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class NGTransitionManager;
@interface UIViewController (Transition)
/**
 push动画
 @param viewController 被push viewController
 @param transitionManager 控制类
 */
- (void)ng_pushViewControler:(UIViewController *)viewController withAnimation:(NGTransitionManager*)transitionManager;

/**
 pop动画
 @param viewController 被pop viewController
 @param transitionManager 控制类
 */
- (void)ng_popViewControler:(UIViewController *)viewController withAnimation:(NGTransitionManager*)transitionManager;
@end

NS_ASSUME_NONNULL_END
