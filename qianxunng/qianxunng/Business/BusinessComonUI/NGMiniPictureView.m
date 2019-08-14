//
//  NGMiniPictureView.m
//  qianxunng
//
//  Created by lihuaqi on 2018/12/14.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGMiniPictureView.h"

@interface NGMiniPictureCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *headerView;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, assign) CGFloat titleW;
@end

@implementation NGMiniPictureCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    CGFloat headerW = 45, iconW = 24;
    _titleW = 45 + 10;
    
    self.headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, headerW, headerW)];
    _headerView.centerX = self.contentView.centerX;
    _headerView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(headerW - 14, - 11, iconW, iconW)];
    _iconView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    self.titleLb = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLb.centerX = self.contentView.centerX;
    _titleLb.textColor = RGB(77, 77, 77);
    _titleLb.font = [UIFont ng_regularFontOfSize:12];
    _titleLb.textAlignment = NSTextAlignmentCenter;
    _titleLb.lineBreakMode = NSLineBreakByCharWrapping;
    _titleLb.numberOfLines = 0;
    
    [self.contentView addSubview:_headerView];
    [_headerView addSubview:_iconView];
    [self.contentView addSubview:_titleLb];
    
}

- (void)refresh {
    CGFloat titleTop = 5, titleH = 20;
    [_titleLb setFrame:CGRectMake(0, _headerView.bottom + titleTop, _titleW, titleH)];
    _titleLb.centerX = self.contentView.centerX;
    
    _headerView.backgroundColor = [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1];
    _titleLb.backgroundColor = [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1];
}
@end

/**
 多小图视图
 */
@interface NGMiniPictureView () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *miniPicture;
@end

@implementation NGMiniPictureView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _collectionInsets = UIEdgeInsetsMake(10, 5, 10, 5);
        _collectionColumns = 5;
        // 图片高度 + 间距 + 文字高度
        _collectionCellHeight = 45 + 5 + 20;
        _collectionLineSpacing = 10;
        _collectionInteritemSpacing = 5;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.alwaysBounceHorizontal = NO;
    _collectionView.scrollEnabled = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView registerClass:NGMiniPictureCell.class forCellWithReuseIdentifier:NSStringFromClass([NGMiniPictureCell class])];
    [self.contentView addSubview:self.collectionView];
    
}

#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.miniPicture.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NGMiniPictureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NGMiniPictureCell class]) forIndexPath:indexPath];
    cell.titleW = [self collectionCellWidth];
    [cell refresh];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([self collectionCellWidth], _collectionCellHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return _collectionInsets;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return _collectionLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return _collectionInteritemSpacing;
}

#pragma mark -- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(miniPicture:didSelectItemAtIndexPath:)]) {
        [self.delegate miniPicture:self didSelectItemAtIndexPath:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(miniPicture:willDisplayItemAtIndexPath:)]) {
        [self.delegate miniPicture:self willDisplayItemAtIndexPath:indexPath];
    }
}

- (void)refreshWithmMiniPicture:(NSArray *)miniPicture {
    _miniPicture = miniPicture;
    [_collectionView setFrame:CGRectMake(0, 0, kScreenWidth, self.frame.size.height)];
    [_collectionView reloadData];
}

- (CGFloat)collectionCellWidth {
    return (kScreenWidth - (_collectionColumns - 1) * _collectionInteritemSpacing - _collectionInsets.left - _collectionInsets.right) / _collectionColumns;
}
@end
