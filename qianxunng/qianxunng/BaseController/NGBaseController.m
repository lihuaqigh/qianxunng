//
//  NGBaseController.m
//  qianxunng
//
//  Created by nangua on 2018/11/12.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGBaseController.h"
#import "NGNavigationBar.h"

@interface NGBaseController ()
@end

@implementation NGBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.navigationBar];
    
    
    
    UIButton *left1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [left1 setTitle:@"啦啦啦1😝" forState:UIControlStateNormal];
    left1.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0 green:arc4random_uniform(256.0)/256.0 blue:arc4random_uniform(256.0)/256.0 alpha:1];
    
    
    UIButton *left2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 100)];
    [left2 setTitle:@"啦啦啦2😝" forState:UIControlStateNormal];
    left2.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0 green:arc4random_uniform(256.0)/256.0 blue:arc4random_uniform(256.0)/256.0 alpha:1];
    
    UIButton *left3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 100)];
    [left3 setTitle:@"啦啦啦3😝" forState:UIControlStateNormal];
    left3.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0 green:arc4random_uniform(256.0)/256.0 blue:arc4random_uniform(256.0)/256.0 alpha:1];
    
    UIBarButtonItem *leftR1 = [[UIBarButtonItem alloc] initWithCustomView:left1];;
    UIBarButtonItem *leftR2 = [[UIBarButtonItem alloc] initWithCustomView:left2];;
    
    
    UIButton *left = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [left setTitle:@"啦啦啦😝" forState:UIControlStateNormal];
    left.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0 green:arc4random_uniform(256.0)/256.0 blue:arc4random_uniform(256.0)/256.0 alpha:1];
    
    UIButton *lefta = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 100)];
    [lefta setTitle:@"啦啦啦a😝" forState:UIControlStateNormal];
    lefta.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0 green:arc4random_uniform(256.0)/256.0 blue:arc4random_uniform(256.0)/256.0 alpha:1];
    UIBarButtonItem *leftR3 = [[UIBarButtonItem alloc] initWithCustomView:left];;
    UIBarButtonItem *leftR4 = [[UIBarButtonItem alloc] initWithCustomView:lefta];;
    
    
    self.navigationItem.leftBarButtonItems = @[leftR3,leftR1];
//    self.navigationItem.rightBarButtonItems = @[leftR1];
//    [self.navigationItem setLeftBarButtonItems:@[leftR2,leftR1] animated:NO];
    
//    [self.navigationItem setLeftBarButtonItem:leftR1 animated:NO];
//
//    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:left];
//

    
//    UILabel *tt = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 500, 100)];
//    tt.text = @"qwerr";
//    tt.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256.0)/256.0 green:arc4random_uniform(256.0)/256.0 blue:arc4random_uniform(256.0)/256.0 alpha:1];
//    self.navigationItem.titleView = tt;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - getter/setter
- (NGNavigationBar *)navigationBar {
    if (_navigationBar == nil) {
        _navigationBar = [[NGNavigationBar alloc] init];
    }
    return _navigationBar;
}

//- (void)setTitle:(NSString *)title {
//    [super setTitle:title];
//    self.navigationBar.title = title;
//}

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
