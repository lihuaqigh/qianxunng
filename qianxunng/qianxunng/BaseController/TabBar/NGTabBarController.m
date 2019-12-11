//
//  NGTabBarController.m
//  qianxunng
//
//  Created by lihuaqi on 2018/11/16.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGTabBarController.h"
#import "NGNavigationController.h"
#import "NGHomeController.h"
#import "NGSearchController.h"
#import "NGMyController.h"
#import "UIImage+image.h"

@interface NGTabBarController ()

@end

@implementation NGTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加所有的控制器
    [self setupAllChildVc];
}

#pragma mark - 添加所有的子控制器
- (void)setupAllChildVc {
    [self addChildVcWithName:@"NGHomeController" title:@"首页" image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_select"]];
    
    [self addChildVcWithName:@"NGCategoryController" title:@"分类" image:[UIImage imageNamed:@"tabbar_discver"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_discver_select"]];
    
    [self addChildVcWithName:@"NGCategoryController" title:@"每日一赚" image:[UIImage imageNamed:@"tabbar_discver"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_discver_select"]];
    
    [self addChildVcWithName:@"NGMyController" title:@"我的" image:[UIImage imageNamed:@"tabbar_my"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_my_select"]];
}

#pragma mark - 添加子控制器
- (void)addChildVcWithName:(NSString *)childControllerName title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    
    UIViewController *childController = [[NSClassFromString(childControllerName) alloc]init];
    childController.title = title;
    childController.tabBarItem.image = image;
    childController.tabBarItem.selectedImage = selectedImage;
    
    UIColor *color = [UIColor colorWithRed:253/255.0 green:75/255.0 blue:48/255.0 alpha:1];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    //导航控制器
    NGNavigationController *nav =[[NGNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
