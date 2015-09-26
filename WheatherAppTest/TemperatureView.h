//
//  TemperatureView.h
//  WheatherAppTest
//
//  Created by 李南 on 15/9/26.
//  Copyright © 2015年 ctd.leonard. All rights reserved.
//

#import "WheatherView.h"
#import "NumberView.h"


@interface TemperatureView : WheatherView<NumberViewDelegate>
@property(nonatomic,assign) CGFloat temperature;

@end
