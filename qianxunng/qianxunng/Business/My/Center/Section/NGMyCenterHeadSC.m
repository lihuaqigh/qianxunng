//
//  NGMyCenterHeadSC.m
//  qianxunng
//
//  Created by lihuaqi on 2019/9/16.
//  Copyright © 2019 HQ. All rights reserved.
//

#import "NGMyCenterHeadSC.h"
#import "NGMyCenterHeadCell.h"

@interface NGMyCenterHeadSC()
@property (nonatomic, strong) NGUser *user;
@end

@implementation NGMyCenterHeadSC

- (void)loginAction {
//    @weakify(self)
    if(![[ALBBSession sharedInstance] isLogin]){
        [[ALBBSDK sharedInstance] setAppkey:@"25355811"];
        [[ALBBSDK sharedInstance] setAuthOption: NormalAuth];
        [[ALBBSDK sharedInstance] auth:self.viewController successCallback:nil failureCallback:nil];
    }else{
        ALBBSession *session=[ALBBSession sharedInstance];
        NSString *tip=[NSString stringWithFormat:@"登录的用户信息:%@",[session getUser]];
        NSLog(@"%@", tip);
    }
}

#pragma mark - delegate
- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 120);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    NGMyCenterHeadCell *cell = [self.collectionContext dequeueReusableCellOfClass:[NGMyCenterHeadCell class] forSectionController:self atIndex:index];
    cell.model = self.user;
    return cell;
}

- (void)didUpdateToObject:(id)object {
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    [self loginAction];
}
@end
