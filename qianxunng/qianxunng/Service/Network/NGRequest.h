//
//  NGRequest.h
//  qianxunng
//
//  Created by lihuaqi on 2020/5/10.
//  Copyright © 2020 HQ. All rights reserved.
//

#import "YTKRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NGRequest : YTKRequest
/**
 请求URL地址
 */
@property(nonatomic, copy) NSString *requestUrl;
 
/**
 请求参数
 */
@property(nonatomic, strong) NSDictionary *requestArgument;
@end

NS_ASSUME_NONNULL_END
