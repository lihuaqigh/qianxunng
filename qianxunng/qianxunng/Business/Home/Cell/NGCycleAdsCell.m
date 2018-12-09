//
//  NGCycleAdsCell.m
//  qianxunng
//
//  Created by lihuaqi on 2018/12/10.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGCycleAdsCell.h"
#import "SDCycleScrollView.h"

@interface NGCycleAdsCell ()
@property (nonatomic, strong) SDCycleScrollView *cycleAdsView;
@end

@implementation NGCycleAdsCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor whiteColor];
    
    self.cycleAdsView = [[SDCycleScrollView alloc] initWithFrame:self.bounds];
    _cycleAdsView.localizationImageNamesGroup = @[@"home_ads_0",@"home_ads_1",@"home_ads_2",@"home_ads_3"];
    _cycleAdsView.backgroundColor = [UIColor whiteColor];
    _cycleAdsView.autoScrollTimeInterval = 3;
    _cycleAdsView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _cycleAdsView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _cycleAdsView.pageControlDotSize = CGSizeMake(7, 7);
    [self.contentView addSubview:_cycleAdsView];
}
@end
