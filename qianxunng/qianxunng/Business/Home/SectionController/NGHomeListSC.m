//
//  NGHomeListSC.m
//  qianxunng
//
//  Created by lihuaqi on 2018/11/16.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGHomeListSC.h"
#import "NGCouponSingleCell.h"

@implementation NGHomeListSC

- (instancetype)init {
    if (self = [super init]) {
        self.inset = UIEdgeInsetsMake(8, 0, 0, 0);
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 20;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(kScreenWidth, 146);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    NGCouponSingleCell *cell = [self.collectionContext dequeueReusableCellOfClass:[NGCouponSingleCell class] forSectionController:self atIndex:index];
    return cell;
}

- (void)didUpdateToObject:(id)object {
}

-(void)didSelectItemAtIndex:(NSInteger)index {
    
}

- (void)OpenPageByNewWay:(id<AlibcTradePage>)page BizCode:(NSString *)bizCode{
    AlibcTradeShowParams* showParam = [[AlibcTradeShowParams alloc] init];
    showParam.openType = 0;
    //    showParam.backUrl=@"tbopen23082328:https://h5.m.taobao.com";
    showParam.nativeFailMode=1;
    
    [AlibcTradeSDK sharedInstance];
    
//    [[AlibcTradeSDK sharedInstance];
    
}
@end
