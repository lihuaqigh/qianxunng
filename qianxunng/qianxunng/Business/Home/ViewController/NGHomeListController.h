//
//  NGHomeListController.h
//  qianxunng
//
//  Created by lihuaqi on 2018/12/9.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "NGBaseController.h"
#import "JXCategoryListCollectionContainerView.h"

@interface NGHomeListController : NGBaseController <JXCategoryListCollectionContentViewDelegate>
@property (nonatomic, strong) UINavigationController *naviController;
@end
