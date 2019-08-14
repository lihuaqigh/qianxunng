//
//  NGHomeListController.m
//  qianxunng
//
//  Created by lihuaqi on 2018/12/9.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGHomeListController.h"
#import "NGHomeListViewModel.h"
#import "NGHomeListSC.h"
#import "NGHomeCycleAdsSC.h"
#import "NGHomeMiniPictureSC.h"

@interface NGHomeListController () <IGListAdapterDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NGHomeListViewModel *homeListViewModel;
@end

@implementation NGHomeListController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.homeListViewModel = [[NGHomeListViewModel alloc] init];
    
    [self setupNavigationBar];
    
    [self setupViews];
}

#pragma mark - navigationBar
- (void)setupNavigationBar {
    self.navigationBar.hidden = YES;
    
}

#pragma mark - subviews
- (void)setupViews {
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:[UICollectionViewFlowLayout new]];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init]
                                           viewController:self];
    
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    self.collectionView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:self.collectionView];
}

#pragma mark - IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return @[kHomeListAds, kHomeListJGQ, @(1)];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[NSString class]]) {
        if ([object isEqualToString:kHomeListAds]) {
             return [NGHomeCycleAdsSC new];
        } else {
             return [NGHomeMiniPictureSC new];
        }
    } else {
        return [NGHomeListSC new];
    }
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - JXCategoryListCollectionContentViewDelegate

- (UIView *)listView {
    return self.view;
}

- (void)listDidAppear {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)listDidDisappear {
    NSLog(@"%@", NSStringFromSelector(_cmd));
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
