//
//  NGLoginManager.m
//  qianxunng
//
//  Created by lihuaqi on 2020/2/5.
//  Copyright © 2020 HQ. All rights reserved.
//

#import "NGLoginManager.h"

NSString * const kLoginStatusChanged = @"kLoginStatusChanged";

@interface NGLoginManager ()

@end

@implementation NGLoginManager
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static NGLoginManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [NGLoginManager new];
    });
    return manager;
}

- (void)login:(UIViewController *)parentController
successCallback:(loginSuccessBlock)onSuccess
failureCallback:(loginFailureBlock)onFailure {
    [[ALBBSDK sharedInstance] setAppkey:@"25355811"];
    [[ALBBSDK sharedInstance] setAuthOption: NormalAuth];
    @weakify(self)
    [[ALBBSDK sharedInstance] auth:parentController successCallback:^(ALBBSession *session) {
        @strongify(self)
        [self loginSuccessHandleWithSession:session];
        [[NSNotificationCenter defaultCenter] postNotificationName:kLoginStatusChanged object:nil];
        if (onSuccess) {
            onSuccess(self.user);
        }
        
    } failureCallback:^(ALBBSession *session, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kLoginStatusChanged object:nil];
        if (onFailure) {
            onFailure(nil ,error);
        }
    }];
}

- (void)loginSuccessHandleWithSession:(ALBBSession *)session {
    ALBBUser *albbUser = [session getUser];
    NGUser *user = [[NGUser alloc] init];
    user.name = albbUser.nick;
    user.icon = albbUser.avatarUrl;
    self.user = user;
}


// 检查登陆状态
- (void)checkLoginStatusWithCompletion:(void(^)(BOOL success))completion {
    BOOL isLogin = NO;
    ALBBSession *session = [ALBBSession sharedInstance];
    if ([session isLogin]) {
        [self loginSuccessHandleWithSession:session];
        isLogin = YES;
    }
    if (completion) {
        completion(isLogin);
    }
}
@end
