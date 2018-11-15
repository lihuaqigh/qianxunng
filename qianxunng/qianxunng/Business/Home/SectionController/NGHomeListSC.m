//
//  NGHomeListSC.m
//  qianxunng
//
//  Created by lihuaqi on 2018/11/16.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGHomeListSC.h"

@implementation NGHomeListSC
- (NSInteger)numberOfItems {
    return 10;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 80);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[UICollectionViewCell class] forSectionController:self atIndex:index];
    cell.contentView.backgroundColor = [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1];
    return cell;
}

- (void)didUpdateToObject:(id)object {
}
@end
