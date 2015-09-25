//
//  EmmiterView.h
//  WheatherAppTest
//
//  Created by 李南 on 15/9/9.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmmiterView : UIView
@property (nonatomic,strong ) CAEmitterLayer *emitterLayer;
-(void)show;
-(void)hide;
@end
