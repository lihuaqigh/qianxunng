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
    [self navigationBarDefault];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.view bringSubviewToFront:self.navigationBar];
}

- (void)navigationBarDefault {
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.navigationBar];
    
    UIImage *backImage = [UIImage imageNamed:@"nav_back_arrow"];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, backImage.size.width, backImage.size.height)];
    [backButton setImage:backImage forState:UIControlStateNormal];
    self.navigationBar.leftBarButtonItem = backButton;
    
}

#pragma mark - getter/setter
- (NGNavigationBar *)navigationBar {
    if (_navigationBar == nil) {
        _navigationBar = [[NGNavigationBar alloc] init];
    }
    return _navigationBar;
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.navigationBar.title = title;
}

- (void)setBackButtonHidden:(BOOL)backButtonHidden {
    _backButtonHidden = backButtonHidden;
    self.navigationBar.leftBarButtonItem.hidden = YES;
}

- (void)setNavigationBarAlpha:(CGFloat)navigationBarAlpha {
    _navigationBarAlpha = navigationBarAlpha;
    self.navigationBar.alpha = navigationBarAlpha;
}

- (void)setNavBarBackgroundAlpha:(CGFloat)navBarBackgroundAlpha {
    _navBarBackgroundAlpha = navBarBackgroundAlpha;
    self.navigationBar.backgroundImageView.alpha = navBarBackgroundAlpha;
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
