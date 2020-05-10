//
//  NGHomeController.m
//  qianxunng
//
//  Created by lihuaqi on 2018/11/16.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGHomeController.h"
#import "QXTwoViewController.h"
#import "NGSearchBar.h"
#import "JXCategoryView.h"
#import "JXCategoryListCollectionContainerView.h"
#import "NGHomeListController.h"
#import "NGCategoryController.h"
#import "NGSearchController.h"
#import "NGFadeTransitionAnimation.h"
#import "UIViewController+Transition.h"
#import "NGHomeFeedRequest.h"

static NSString *const kHomeSubVCId = @"kHomeSubVCId";

@interface NGHomeController ()
<
JXCategoryViewDelegate,
JXCategoryListCollectionContainerViewDataSource
>

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NGSearchBar *searchBar;
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) JXCategoryListCollectionContainerView *listContainerView;
@end

@implementation NGHomeController
#pragma mark - getter/setter
- (NSArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = @[@"推荐",@"美妆",@"母婴",@"女装",@"食品",@"内衣",@"百货",@"家电",@"家居",@"数码",@"汽车"];
    }
    return _dataSource;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupNavigationBar];
    
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NGHomeFeedRequest *req = [[NGHomeFeedRequest alloc] init];
    [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

#pragma mark - navigationBar
- (void)setupNavigationBar {
    [self setBackButtonHidden:YES];
    self.navBarBackgroundAlpha = 0;
    
    _searchBar = [[NGSearchBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 40, 30)];
    _searchBar.searchBarEditing = NO;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    @weakify(self)
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        @strongify(self)
        NGSearchController *vc = [[NGSearchController alloc] init];

        NGFadeTransitionAnimation *fadeTransitionAnimation = [[NGFadeTransitionAnimation alloc] init];
        [self ng_pushViewControler:vc withAnimation:fadeTransitionAnimation];
        
//        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    [_searchBar addGestureRecognizer:tap];
    self.navigationBar.titleView = _searchBar;
}

#pragma mark - subviews
- (void)setupViews {
    //1、初始化JXCategoryTitleView
    self.categoryView = [[JXCategoryTitleView alloc] init];
    self.categoryView.delegate = self;
    self.categoryView.titles = self.dataSource;
    self.categoryView.contentScrollViewClickTransitionAnimationEnabled = NO;
    
    //2、添加并配置指示器
    //lineView
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.lineStyle = JXCategoryIndicatorLineStyle_IQIYI;
    lineView.indicatorLineViewColor = [UIColor redColor];
    lineView.indicatorLineWidth = JXCategoryViewAutomaticDimension;
    _categoryView.indicators = @[lineView];
    
    //3、绑定contentScrollView。self.scrollView的初始化细节参考源码。
    self.listContainerView = [[JXCategoryListCollectionContainerView alloc] initWithDataSource:self];
    [self.view addSubview:self.listContainerView];
    //关联cotentScrollView，关联之后才可以互相联动！！！
    self.categoryView.contentScrollView = self.listContainerView.collectionView;
    
    
    [self.view addSubview:self.categoryView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.categoryView.frame = CGRectMake(0, kNavigationHeight, kScreenWidth, 30);
    self.listContainerView.frame = CGRectMake(0, kNavigationHeight + 30, self.view.bounds.size.width, self.view.bounds.size.height - (kNavigationHeight + 30));
}



#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
    
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    
}

#pragma mark - JXCategoryListCollectionContainerViewDataSource
- (id<JXCategoryListCollectionContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    if (index == 0) {
        NGHomeListController *homeListVC = [[NGHomeListController alloc] init];
        homeListVC.naviController = self.navigationController;
        return homeListVC;
    } else {
        NGCategoryController *categoryVC = [[NGCategoryController alloc] init];
        categoryVC.naviController = self.navigationController;
        return categoryVC;
    }
    
    
    
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.dataSource.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
