//
//  UIView+Frame.h
//  qianxunng
//
//  Created by lihuaqi on 2020/4/4.
//  Copyright © 2020 HQ. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

#ifdef __cplusplus
extern "C" {
#endif
    // 截图尺寸
    CGFloat NGHeight812For2339(CGFloat value);
    CGFloat NGWidth375For1080(CGFloat value);
#ifdef __cplusplus
}
#endif
@end

NS_ASSUME_NONNULL_END
