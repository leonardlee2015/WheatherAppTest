//
//  numberView.h
//  WheatherAppTest
//
//  Created by 李南 on 15/9/21.
//  Copyright © 2015年 ctd.leonard. All rights reserved.
//

#import "WheatherView.h"
#import "NumberAnimation.h"
#import <UIKit/UIKit.h>

@protocol NumberViewDelegate <WheatherViewDelegate>
@required
/**
 *  @brief  实现 数字的显示效果。
 *
 *  @param number 数字
 *
 *  @return 数字属性符串
 */
-(NSAttributedString*)accessNumber:(CGFloat)number;

@end
@interface NumberView : WheatherView

@property(nonatomic) NSInteger number;
@property(nonatomic,weak) id<NumberViewDelegate> delegate;
@property(nonatomic) BOOL AdjustNumberSize;
-(instancetype)initWithNumber:( CGFloat) number;
@end
