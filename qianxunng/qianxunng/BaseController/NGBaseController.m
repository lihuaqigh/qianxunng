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
- (NGNavigationBar *)navigationBar {
    if (_navigationBar == nil) {
        _navigationBar = [[NGNavigationBar alloc] init];
    }
    return _navigationBar;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.navigationBar];
    
    
    
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
