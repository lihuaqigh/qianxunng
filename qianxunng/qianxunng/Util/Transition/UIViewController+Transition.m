//
//  UIViewController+Transition.m
//  IGListDemo
//
//  Created by nangua on 2019/8/11.
//  Copyright © 2019 lhq. All rights reserved.
//

#import "UIViewController+Transition.h"
#import "NGTransitionManager.h"
#import <objc/runtime.h>

static NSString *const kAnimationKey = @"kAnimationKey";

@implementation UIViewController (Transition)
// push动画
- (void)ng_pushViewControler:(UIViewController *)viewController withAnimation:(NGTransitionManager *)transitionManager {
    if (!viewController) {
        return;
    }
    if (!transitionManager) {
        return;
    }
    
    if (self.navigationController) {
        
        self.navigationController.delegate = transitionManager;
        
        objc_setAssociatedObject(viewController, &kAnimationKey, transitionManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        __weak typeof(viewController) weakVc = viewController;
        [[viewController rac_signalForSelector:@selector(viewDidAppear:)] subscribeNext:^(id x) { weakVc.navigationController.delegate = nil; }];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

// pop动画
- (void)ng_popViewControler:(UIViewController *)viewController withAnimation:(NGTransitionManager *)transitionManager {
    if (!viewController) {
        return;
    }
    if (!transitionManager) {
        return;
    }
    
    if (self.navigationController) {
        
        self.navigationController.delegate = transitionManager;
        
        objc_setAssociatedObject(viewController, &kAnimationKey, transitionManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        __weak typeof(viewController) weakVc = viewController;
        [[viewController rac_signalForSelector:@selector(viewDidDisappear:)] subscribeNext:^(id x) { weakVc.navigationController.delegate = nil; }];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
