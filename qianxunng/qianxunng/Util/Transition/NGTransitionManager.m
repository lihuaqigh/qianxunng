//
//  NGTransitionManager.m
//  IGListDemo
//
//  Created by nangua on 2019/8/9.
//  Copyright © 2019 lhq. All rights reserved.
//

#import "NGTransitionManager.h"
#import "NGTransitionAnimation.h"

@interface NGTransitionManager ()
/**
 入场动画
 */
@property (nonatomic,strong) NGTransitionAnimation *toTransitionAnimation;

/**
 退场动画
 */
@property (nonatomic,strong) NGTransitionAnimation *backTransitionAnimation;
@end


@implementation NGTransitionManager

- (void)dealloc {
    
}

- (id)init {
    self = [super init];
    if (self) {
        self.duration = 0.5;
    }
    return self;
}

#pragma mark == UINavigationControllerDelegate
// 执行顺序 先
// 非手势转场交互 for push or pop
/*****注释:通过 fromVC 和 toVC 我们可以在此设置需要自定义动画的类 *****/
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush)
    {
        return self.toTransitionAnimation;
    }
    else if (operation == UINavigationControllerOperationPop)
    {
        return self.backTransitionAnimation;
    }
    else
    {
        return nil;
    }
}

#pragma mark == public method
- (void)setToAnimation:(id<UIViewControllerContextTransitioning>)contextTransition {
    //需在子类中进行重写
}

- (void)setBackAnimation:(id<UIViewControllerContextTransitioning>)contextTransition {
    //需在子类中进行重写
}

#pragma mark == 懒加载
- (NGTransitionAnimation *)toTransitionAnimation {
    if (nil == _toTransitionAnimation) {
        __weak typeof(self) weakSelf = self;
        _toTransitionAnimation = [[NGTransitionAnimation alloc] initWithDuration:self.duration];
        _toTransitionAnimation.animationBlock = ^(id<UIViewControllerContextTransitioning> contextTransition)
        {
            [weakSelf setToAnimation:contextTransition];
        };
    }
    return _toTransitionAnimation;
}

- (NGTransitionAnimation *)backTransitionAnimation {
    if (nil == _backTransitionAnimation) {
        __weak typeof(self) weakSelf = self;
        _backTransitionAnimation = [[NGTransitionAnimation alloc] initWithDuration:self.duration];
        _backTransitionAnimation.animationBlock = ^(id<UIViewControllerContextTransitioning> contextTransition)
        {
            [weakSelf setBackAnimation:contextTransition];
        };
    }
    return _backTransitionAnimation;
}
@end
