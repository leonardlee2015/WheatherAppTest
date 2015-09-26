//
//  CycleView.h
//  WheatherAppTest
//
//  Created by 李南 on 15/9/16.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "WheatherView.h"


@interface CycleView : WheatherView
/**
 *  @author ctd.leonard, 15-09-16 17:09:53
 *
 *  @brief  percent .
 */
@property (nonatomic,assign) CGFloat  percent;
@property (nonatomic,assign) CGFloat baseStokeEnd;
@property (nonatomic) CGFloat lineWidth;

@end
