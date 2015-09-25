//
//  FlickButton.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/10.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "FlatButton.h"
#import "UIColor+CustomColor.h"

#import <pop/POP.h>

@interface FlatButton ()

@end
@implementation FlatButton
#pragma mark - initialize methods
// 设置 titleLabel 边界。
-(UIEdgeInsets)titleEdgeInsets{
    return UIEdgeInsetsMake(4, 35, 4, 35);
}


// 设置 button nature size.
-(CGSize)intrinsicContentSize{
    CGSize size = [super intrinsicContentSize];
    CGSize newSize = CGSizeMake(size.width+self.titleEdgeInsets.left+self.titleEdgeInsets.right, size.height+self.titleEdgeInsets.top+self.titleEdgeInsets.bottom);
    return newSize;
}

+(instancetype)button{
    return  [self buttonWithType:UIButtonTypeCustom];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    // 设置 button 外观。
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium"
                                           size:22];
    
    self.layer.cornerRadius = 4.0f;
    
    
    
    // 为 button 设置 按下效果。
    //[self addTarget:self action:@selector(scaleToSmall:) forControlEvents:UIControlEventTouchDown ];
    //[self addTarget:self action:@selector(scaleSpringAnimation:) forControlEvents:UIControlEventTouchUpInside];
    //[self addTarget:self action:@selector(scaleCancel:) forControlEvents:UIControlEventTouchDragExit];
}

-(IBAction)scaleToSmall:(id)sender{
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9f, 0.9f)];
    
    [self pop_addAnimation:anim forKey:@"scaleToSmallAnimatonKey"];
    
}
-(IBAction)scaleSpringAnimation :(id)sender{
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    anim.toValue = [NSValue  valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
    anim.velocity = [NSValue valueWithCGSize:CGSizeMake(3, 3)];
    anim.springBounciness = 18 ;
    [self pop_addAnimation:anim forKey:@"viewScaleSpringAnimaiotnKey"];
}
-(IBAction)scaleCancel:(id)sender{
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0f, 1.0f)];
    
    [self pop_addAnimation:anim forKey:@"scaleToSmallAnimatonKey"];
}
/*
-(void)setHighlighted:(BOOL)highlighted{
    if (highlighted) {
        [self scaleToSmall:nil];
    }else{
        [self scaleSpringAnimation:nil];
    }
 

}
 */
@end
