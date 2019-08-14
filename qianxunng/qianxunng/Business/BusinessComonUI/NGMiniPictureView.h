//
//  NGMiniPictureView.h
//  qianxunng
//
//  Created by lihuaqi on 2018/12/14.
//  Copyright © 2018年 HQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NGMiniPictureView;
@protocol NGMiniPictureViewDelegate <NSObject>
/// 小图点击
- (void)miniPicture:(NGMiniPictureView *)miniPicture didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
/// 小图展示
- (void)miniPicture:(NGMiniPictureView *)miniPicture willDisplayItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface NGMiniPictureView : UICollectionViewCell
@property (nonatomic, weak) id <NGMiniPictureViewDelegate>delegate;
@property (nonatomic, assign) UIEdgeInsets collectionInsets;
@property (nonatomic, assign) CGFloat collectionColumns;
@property (nonatomic, assign) CGFloat collectionCellHeight;
@property (nonatomic, assign) CGFloat collectionLineSpacing;
@property (nonatomic, assign) CGFloat collectionInteritemSpacing;
/// 刷新UI
- (void)refreshWithmMiniPicture:(NSArray *)miniPicture;
@end
