//
//  NGPostRequest.m
//  qianxunng
//
//  Created by lihuaqi on 2020/5/10.
//  Copyright © 2020 HQ. All rights reserved.
//

#import "NGPostRequest.h"

@implementation NGPostRequest
- (instancetype)initWithRequestUrl:(NSString *)url argument:(NSDictionary *)argument {
    self = [super init];
    if (self) {
        self.requestUrl = url;
        self.requestArgument = argument;
    }
    return self;
}
 
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}
@end
