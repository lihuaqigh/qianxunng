//
//  NGRequest.m
//  qianxunng
//
//  Created by lihuaqi on 2020/5/10.
//  Copyright © 2020 HQ. All rights reserved.
//

#import "NGRequest.h"

@implementation NGRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSString *)baseUrl {
    return @"http://192.168.2.11:18306";
}
 
- (NSTimeInterval)requestTimeoutInterval {
    return 8;
}

- (NSString *)requestUrl {
    if ([self.requestUrl isKindOfClass:NSString.class] && self.requestUrl.length > 0) {
        return self.requestUrl;
    } else {
        return @"";
    }
}

- (id)requestArgument {
    if ([self.requestArgument isKindOfClass:NSDictionary.class] && self.requestArgument.allKeys.count > 0) {
        return self.requestArgument;
    } else {
        return @{};
    }
}

@end
