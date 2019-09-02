//
//  NGNavigationController.m
//  qianxunng
//
//  Created by nangua on 2018/11/12.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGNavigationController.h"

@interface NGNavigationController ()

@end

@implementation NGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    

}

#pragma mark - 拦截所有的push进来的子控制器，设置隐藏底部的tabBar
/**
 能拦截所有push进来的子控制器
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //如果现在push的不是栈底控制器（最先push进来的那个控制器）
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
