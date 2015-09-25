//
//  UIView+SetRect.h
//  WheatherAppTest
//
//  Created by 李南 on 15/9/1.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SetRect)

/**
 *  @author ctd.leonard, 15-09-02 00:09:40
 *
 *  @brief  capsulation of  self.frame.size
 */
@property (nonatomic, assign) CGSize ViewSize;
/**
 *  @author ctd.leonard, 15-09-02 00:09:40
 *
 *  @brief  capsulation of  self.frame.origin.
 */
@property (nonatomic, assign) CGPoint ViewOrigin;

@property (nonatomic, assign) CGFloat viewOriginX;
@property (nonatomic, assign) CGFloat viewOriginY;
@property (nonatomic, assign) CGFloat viewSizeWidth;
@property (nonatomic, assign) CGFloat viewSizeHeight;
@property (nonatomic, assign) CGFloat viewCenterX;
@property (nonatomic, assign) CGFloat viewCenterY;
@end
