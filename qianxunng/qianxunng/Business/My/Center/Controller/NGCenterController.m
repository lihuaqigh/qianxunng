//
//  NGCenterController.m
//  qianxunng
//
//  Created by lihuaqi on 2018/11/16.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGCenterController.h"
#import "NGCenterHeadView.h"

@interface NGCenterController () <IGListAdapterDataSource>
@property (nonatomic, strong) NGCenterHeadView *headView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSArray *data;
@end

@implementation NGCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addNotif];
    [self setupNavigationBar];
    [self setupViews];
}

- (void)addNotif {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginChanged) name:kLoginStatusChanged object:nil];
}

- (void)loginChanged {
    [self.adapter reloadDataWithCompletion:nil];
}

- (void)setupNavigationBar {
    [self setBackButtonHidden:YES];
    self.navBarBackgroundAlpha = 0;
    self.navigationBar.title = @"";
}

#pragma mark - subviews
- (void)setupViews {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:[UICollectionViewFlowLayout new]];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init]
                                           viewController:self];
    
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    self.collectionView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    self.collectionView.contentInset = UIEdgeInsetsMake([NGCenterHeadView headHeight], 0, 0, 0);
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.headView];
}

#pragma mark - IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return @[@(0)];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return nil;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (NGCenterHeadView *)headView {
    if (_headView == nil) {
        _headView = [[NGCenterHeadView alloc] init];
    }
    return _headView;
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
