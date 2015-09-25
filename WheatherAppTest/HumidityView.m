//
//  HumidityView.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/16.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "HumidityView.h"
#import "UIColor+CustomColor.h"
#import "UIView+SetRect.h"
#import "CycleView.h"
#import "NumberView.h"
#import "MoveTitleLabel.h"

@implementation HumidityView{
    CycleView *_cycleView;
    NumberView * _numberView;
    MoveTitleLabel *_titleView;
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        if (frame.size.width != frame.size.height) {
            self = nil;
            [[[UIAlertView alloc]initWithTitle:@"Wrong Frame!"
                                      message:@"frame's width must be same as its height"
                                     delegate:nil
                            cancelButtonTitle:@"canncel"
                             otherButtonTitles: nil] show];
            

            
        }
    }
    return self;
}

-(void)buildView{
    _cycleView = [[CycleView alloc]initWithFrame:CGRectMake(45, 55, 115, 115)];
    _cycleView.percent = self.Humidity;
    [self addSubview:_cycleView];
    [_cycleView buildView];
    
    _numberView = [[NumberView alloc] initWithFrame:CGRectMake(45, 55, 115, 115)];
    _numberView.number = self.Humidity;
    [self addSubview:_numberView];
    [_numberView buildView];
    
    _titleView = [[MoveTitleLabel alloc] initWithFrame:CGRectMake(20, 10, 0,0)];
    _titleView.title = @"Humidity" ;
    _titleView.font = [UIFont fontWithName:@"Avenir-Light" size:20];
    _titleView.offset = CGPointMake(40, 0);
    [self addSubview:_titleView ];
    [_titleView buildView];
    
}

-(void)show{
    [_cycleView show];
    [_numberView show];
    [_titleView show];
}

-(void)hide{
    [_cycleView hide];
    [_numberView hide];
    [_titleView hide];
}

#pragma mark - properties
-(void)setHumidity:(CGFloat)Humidity{
    _Humidity = Humidity;
    _cycleView.percent = Humidity;
    _numberView.number = Humidity;
    
}

@end
