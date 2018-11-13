//
//  UIViewController+Nav.m
//  qianxunng
//
//  Created by nangua on 2018/11/13.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "UIViewController+Nav.h"
#import <objc/runtime.h>

@implementation UIViewController (Nav)
+ (void)load {
    [self swizzleMethod:@selector(viewDidLoad) anotherMethod:@selector(ng_viewDidLoad)];
}

+ (void)swizzleMethod:(SEL)oneSel anotherMethod:(SEL)anotherSel{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oneMethod = class_getInstanceMethod(self, oneSel);
        Method anotherMethod = class_getInstanceMethod(self, anotherSel);
        if (!oneMethod || !anotherMethod) return;
        method_exchangeImplementations(oneMethod, anotherMethod);
    });
}

- (void)ng_viewDidLoad {
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.navigationBar];
    [self ng_viewDidLoad];
}

#pragma mark - 关联属性
- (NGNavigationBar *)navigationBar {
    NGNavigationBar *navigationBar = objc_getAssociatedObject(self, _cmd);
    if (navigationBar == nil) {
        navigationBar = [[NGNavigationBar alloc] init];
    }
    return navigationBar;
}

- (void)setNavigationBar:(NGNavigationBar *)navigationBar {
    objc_setAssociatedObject(self, @selector(navigationBar), navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)ng_title {
    return [objc_getAssociatedObject(self, _cmd) stringValue];
}

- (void)setNg_title:(NSString *)ng_title {
    self.navigationBar.title = ng_title;
    objc_setAssociatedObject(self, @selector(ng_title), ng_title, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
