//
//  NGPostRequest.h
//  qianxunng
//
//  Created by lihuaqi on 2020/5/10.
//  Copyright © 2020 HQ. All rights reserved.
//

#import "NGRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NGPostRequest : NGRequest
- (instancetype)initWithRequestUrl:(NSString *)url argument:(NSDictionary *)argument;
@end

NS_ASSUME_NONNULL_END
