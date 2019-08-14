//
//  NGTransitionAnimation.h
//  IGListDemo
//
//  Created by nangua on 2019/8/9.
//  Copyright © 2019 lhq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
GLTransitionAnimation 块
@param contextTransition 将满足UIViewControllerContextTransitioning协议的对象传到管理内 在管理类对动画统一实现
*/
typedef void(^NGTransitionAnimationBlock)(id <UIViewControllerContextTransitioning> contextTransition);

@interface NGTransitionAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic,copy) NGTransitionAnimationBlock animationBlock;

/**
 初始化方法
 @param duration 转场时间
 @return 返回
 */
- (id)initWithDuration:(NSTimeInterval)duration;

@end

NS_ASSUME_NONNULL_END
