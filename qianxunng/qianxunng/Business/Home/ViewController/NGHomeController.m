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
#import "NGHomeListController.h"
#import "NGSearchController.h"

static NSString *const kHomeSubVCId = @"kHomeSubVCId";

@interface NGHomeController () <UICollectionViewDataSource,UICollectionViewDelegate,JXCategoryViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, strong) NGSearchBar *searchBar;
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
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
    
    [self setupViewControllers];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
        [self.navigationController pushViewController:[[NGSearchController alloc] init] animated:YES];
    }];
    [_searchBar addGestureRecognizer:tap];
    self.navigationBar.titleView = _searchBar;
}

#pragma mark - subviews
- (void)setupViews {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:layout];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.bounces = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kHomeSubVCId];
    
    
    //1、初始化JXCategoryTitleView
    self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, kNavigationHeight, kScreenWidth, 30)];
    _categoryView.delegate = self;
    _categoryView.titles = self.dataSource;
    
    //2、添加并配置指示器
    //lineView
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.lineStyle = JXCategoryIndicatorLineStyle_IQIYI;
    lineView.indicatorLineViewColor = [UIColor redColor];
    lineView.indicatorLineWidth = JXCategoryViewAutomaticDimension;
    _categoryView.indicators = @[lineView];
    
    //3、绑定contentScrollView。self.scrollView的初始化细节参考源码。
    _categoryView.contentScrollView = self.collectionView;
    
    
    _collectionView.frame = CGRectMake(0, _categoryView.bottom, kScreenWidth, kScreenHeight);
    [self.view addSubview:self.categoryView];
    [self.view addSubview:self.collectionView];
}

- (void)setupViewControllers {
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
    for (int i = 0; i < self.dataSource.count; i++) {
        [self addChildViewController:[[NGHomeListController alloc] init]];
    }
    [self.collectionView reloadData];
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.childViewControllers.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NGBaseController *vc = [self.childViewControllers objectAtIndex:indexPath.row];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHomeSubVCId forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    vc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:vc.view];
    return cell;
}

#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
    
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
