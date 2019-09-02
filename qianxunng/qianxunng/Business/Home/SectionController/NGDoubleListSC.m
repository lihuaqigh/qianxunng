//
//  NGDoubleListSC.m
//  qianxunng
//
//  Created by lihuaqi on 2019/9/2.
//  Copyright © 2019 HQ. All rights reserved.
//

#import "NGDoubleListSC.h"
#import "NGCouponDoubleCell.h"

@implementation NGDoubleListSC
- (instancetype)init {
    if (self = [super init]) {
        self.inset = UIEdgeInsetsMake(8, 10, 8, 10);
        self.minimumLineSpacing = 7;
        self.minimumInteritemSpacing = 7;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 40;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat cellW = (kScreenWidth - 10 * 2 - 7) / 2;
    return CGSizeMake(cellW, cellW + 100);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    NGCouponDoubleCell *cell = [self.collectionContext dequeueReusableCellOfClass:[NGCouponDoubleCell class] forSectionController:self atIndex:index];
    return cell;
}

- (void)didUpdateToObject:(id)object {
}
@end
