//
//  NGLoginManager.h
//  qianxunng
//
//  Created by lihuaqi on 2020/2/5.
//  Copyright © 2020 HQ. All rights reserved.
//

#import <Foundation/Foundation.h>

UIKIT_EXTERN NSString * const kLoginStatusChanged;

/** 回调定义 */
typedef void (^loginSuccessBlock)(NGUser *user);
typedef void (^loginFailureBlock)(NGUser *user ,NSError *error);
typedef void (^loginResultBlock)(NGUser *user);

@interface NGLoginManager : NSObject
@property (nonatomic, strong) NGUser *user;

+ (instancetype)sharedManager;

// 登陆
- (void)login:(UIViewController *)parentController
successCallback:(loginSuccessBlock)onSuccess
failureCallback:(loginFailureBlock)onFailure;

// 检查登陆状态
- (void)checkLoginStatusWithCompletion:(void(^)(BOOL success))completion;
@end
