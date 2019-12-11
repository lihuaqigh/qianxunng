//
//  AppDelegate+ALBC.m
//  qianxunng
//
//  Created by lihuaqi on 2019/9/15.
//  Copyright © 2019 HQ. All rights reserved.
//

#import "AppDelegate+ALBC.h"

@implementation AppDelegate (ALBC)
- (void)initALBCServiceWithApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[AlibcTradeSDK sharedInstance] setDebugLogOpen:NO];
    
    [[AlibcTradeSDK sharedInstance] setIsvVersion:@"1.0.0"];
    
    [[AlibcTradeSDK sharedInstance] setIsvAppName:@"baichuanDemo"];
    
    [[AlibcTradeSDK sharedInstance] asyncInitWithSuccess:^{
        NSLog(@"百川初始化成功！");
    } failure:^(NSError *error) {
        NSLog(@"百川初始化失败！");
    }];
    
}
@end
