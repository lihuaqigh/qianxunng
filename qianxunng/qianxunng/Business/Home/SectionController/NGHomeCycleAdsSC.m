//
//  NGHomeCycleAdsSC.m
//  qianxunng
//
//  Created by lihuaqi on 2018/12/10.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGHomeCycleAdsSC.h"
#import "NGCycleAdsCell.h"

@implementation NGHomeCycleAdsSC
- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 180);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    NGCycleAdsCell *cell = [self.collectionContext dequeueReusableCellOfClass:[NGCycleAdsCell class] forSectionController:self atIndex:index];
    return cell;
}

- (void)didUpdateToObject:(id)object {
}
@end
