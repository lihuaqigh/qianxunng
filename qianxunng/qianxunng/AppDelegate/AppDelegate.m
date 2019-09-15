//
//  AppDelegate.m
//  qianxunng
//
//  Created by lihuaqi on 2018/11/6.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+ALBC.h"
#import <AlibcTradeSDK/AlibcTradeSDK.h>
#import "NGTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self initALBCServiceWithApplication:application didFinishLaunchingWithOptions:launchOptions];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NGTabBarController *tvc = [[NGTabBarController alloc] init];
    self.window.rootViewController = tvc;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -  handleOpenURL

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return YES;
}

// iOS 7&8
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    if (![[AlibcTradeSDK sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation]) {
        // Fallback on earlier versions
    }
    return YES;
}


// iOS 9&9+
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary *)options {
    
    if (@available(iOS 9.0, *)) {
        if (![[AlibcTradeSDK sharedInstance] application:application openURL:url options:options]) {
            // Fallback on earlier versions
        }
    } else {
        // Fallback on earlier versions
    }
    return YES;
}


@end
