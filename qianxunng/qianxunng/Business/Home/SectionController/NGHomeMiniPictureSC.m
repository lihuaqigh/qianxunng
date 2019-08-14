//
//  NGHomeMiniPictureSC.m
//  qianxunng
//
//  Created by lihuaqi on 2018/12/14.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGHomeMiniPictureSC.h"
#import "NGMiniPictureView.h"

@interface NGHomeMiniPictureSC()
@property (nonatomic, strong) NSArray *miniPicture;
@property (nonatomic, assign) CGFloat collectionColumns;
@end

@implementation NGHomeMiniPictureSC

- (instancetype)init {
    if (self = [super init]) {
        self.miniPicture = @[@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0"];
        _collectionColumns = 4;
        
    }
    return self;
}

// 计算当前SectionController整体高度
- (CGFloat)sectionHeight {
    CGFloat collectionCellHeight = 45 + 5 + 20;
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 5, 10, 5);
    CGFloat lineSpacing = 10;
    
    NSInteger rowCount = self.miniPicture.count / _collectionColumns;
    CGFloat sectionHeight = rowCount * collectionCellHeight + (rowCount -1) * lineSpacing + insets.bottom + insets.top;
    return sectionHeight;
}

#pragma mark - IGList
- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, [self sectionHeight]);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    NGMiniPictureView *cell = [self.collectionContext dequeueReusableCellOfClass:[NGMiniPictureView class] forSectionController:self atIndex:index];
    cell.collectionColumns = _collectionColumns;
    [cell refreshWithmMiniPicture:self.miniPicture];
    return cell;
}

- (void)didUpdateToObject:(id)object {
}

@end
