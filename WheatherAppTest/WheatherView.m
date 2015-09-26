//
//  WheatherView.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/16.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "WheatherView.h"


@implementation WheatherView
-(void)buildView{
    
}
-(void)show{
    if (self.delegate && [self.delegate respondsToSelector:@selector(additionShowAnimationToView:)]) {
        [self.delegate additionShowAnimationToView:self];
    }
    
}
-(void)hide{
    if (self.delegate && [self.delegate respondsToSelector:@selector(additionHideAnimationToView:)]) {
        [self.delegate additionHideAnimationToView:self];
    }
}
@end
