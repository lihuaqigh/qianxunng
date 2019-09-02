//
//  NGCategoryController.h
//  qianxunng
//
//  Created by lihuaqi on 2019/9/2.
//  Copyright © 2019 HQ. All rights reserved.
//

#import "NGBaseController.h"
#import "JXCategoryListCollectionContainerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NGCategoryController : NGBaseController <JXCategoryListCollectionContentViewDelegate>
@property (nonatomic, strong) UINavigationController *naviController;
@end

NS_ASSUME_NONNULL_END
