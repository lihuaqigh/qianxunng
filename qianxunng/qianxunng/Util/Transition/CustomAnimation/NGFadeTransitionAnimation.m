//
//  NGFadeTransitionAnimation.m
//  IGListDemo
//
//  Created by nangua on 2019/8/11.
//  Copyright © 2019 lhq. All rights reserved.
//

#import "NGFadeTransitionAnimation.h"

@interface NGFadeTransitionAnimation ()
@end

@implementation NGFadeTransitionAnimation

- (void)setToAnimation:(id<UIViewControllerContextTransitioning>)contextTransition
{
    UIView *containerView    = [contextTransition containerView];
    UIViewController *toVC   = [contextTransition viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView           = toVC.view;
    
    [containerView addSubview:toView];
    
    toView.alpha = 0;
    [UIView animateWithDuration:self.duration
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut
                     animations:^{ toView.alpha = 1; }
                     completion:^(BOOL finished) { [contextTransition completeTransition:![contextTransition transitionWasCancelled]]; }];
}

- (void)setBackAnimation:(id<UIViewControllerContextTransitioning>)contextTransition
{
    UIView *containerView    = [contextTransition containerView];
    UIViewController *fromVC = [contextTransition viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC   = [contextTransition viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView         = fromVC.view;
    UIView *toView           = toVC.view;

    [containerView addSubview:toView];

    fromView.alpha = 1;
    [containerView addSubview:fromView];
    [UIView animateWithDuration:self.duration
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         fromView.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [fromView removeFromSuperview];
                         [contextTransition completeTransition:![contextTransition transitionWasCancelled]];
                     }];

}
@end
