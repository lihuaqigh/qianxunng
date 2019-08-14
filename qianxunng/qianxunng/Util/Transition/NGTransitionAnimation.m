//
//  NGTransitionAnimation.m
//  IGListDemo
//
//  Created by nangua on 2019/8/9.
//  Copyright © 2019 lhq. All rights reserved.
//

#import "NGTransitionAnimation.h"

@interface NGTransitionAnimation ()


/**
 动画时间
 */
@property (nonatomic,assign) NSTimeInterval duration;


@end

@implementation NGTransitionAnimation
- (id)initWithDuration:(NSTimeInterval)duration
{
    self = [super init];
    if (self) {
        _duration = duration;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.animationBlock) {
        self.animationBlock(transitionContext);
    }
}
@end
