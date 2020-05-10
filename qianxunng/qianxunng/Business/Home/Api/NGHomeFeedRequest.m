//
//  NGHomeFeedRequest.m
//  qianxunng
//
//  Created by lihuaqi on 2020/5/10.
//  Copyright © 2020 HQ. All rights reserved.
//

#import "NGHomeFeedRequest.h"

@implementation NGHomeFeedRequest

- (NSString *)requestUrl {
    return @"/index/product/feed";
}

- (id)requestArgument {
    return @{@"page" : @"1", @"cate_collection_id" : @"1"};
}
@end
