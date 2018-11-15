//
//  ViewController.m
//  qianxunng
//
//  Created by lihuaqi on 2018/11/6.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "ViewController.h"
#import "QXTwoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)setupNavigationBar {
    self.title = @"标题";
    
    [self setBackButtonHidden:YES];
    
    self.navBarBackgroundAlpha = 0;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.navigationController pushViewController:[QXTwoViewController new] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
