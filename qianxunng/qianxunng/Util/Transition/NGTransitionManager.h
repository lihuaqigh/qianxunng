//
//  NGTransitionManager.h
//  IGListDemo
//
//  Created by nangua on 2019/8/9.
//  Copyright © 2019 lhq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NGTransitionManager : NSObject
<
UINavigationControllerDelegate,
UIViewControllerTransitioningDelegate
>

/**
 转场动画的时间 默认为0.5s
 */
@property (nonatomic,assign) NSTimeInterval duration;

/**
 入场动画
 @param contextTransition 实现动画
 */
- (void)setToAnimation:(id<UIViewControllerContextTransitioning>)contextTransition;

/**
 退场动画
 @param contextTransition 实现动画
 */
- (void)setBackAnimation:(id<UIViewControllerContextTransitioning>)contextTransition;

@end
NS_ASSUME_NONNULL_END
