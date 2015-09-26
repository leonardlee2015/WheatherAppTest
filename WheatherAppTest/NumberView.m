//
//  numberView.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/21.
//  Copyright © 2015年 ctd.leonard. All rights reserved.
//

#import "NumberView.h"
#import "NumberAnimation.h"

#import <pop/POP.h>

@interface NumberView ()<NumberAnimationDelegate>
@property (nonatomic,strong) UILabel *numberLabel;
@property (nonatomic,strong) NumberAnimation *animation;
@end
@implementation NumberView

@dynamic delegate;

-(instancetype)initWithNumber:( CGFloat)number{
    self = [super init];
    if (self) {
        self.number = number;
       
        self.AdjustNumberSize = NO;
        
        
    }
    return self;
}




-(void)buildView{
    // preset view to transparent
    //self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    self.alpha = 0.0f;
    // size
    _numberLabel = [[UILabel alloc]init];
    
    //_numberLabel.backgroundColor = [UIColor greenColor];
    self.numberLabel.textAlignment = NSTextAlignmentCenter;

    [self setNumberLabelNumber:self.number];

    self.numberLabel.adjustsFontSizeToFitWidth = YES;
    self.numberLabel.textColor = [UIColor blackColor];
    
    [self addSubview:self.numberLabel];
    self.numberLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.numberLabel
                                                    attribute:NSLayoutAttributeCenterX
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0f
                                                      constant:5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.numberLabel
                                                    attribute:NSLayoutAttributeCenterY
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeCenterY
                                                   multiplier:1.0f
                                                      constant:0]];
    //
    //[self.numberLabel sizeToFit];
      //[self layoutIfNeeded];
    NSLog(@"%f,%f,%f,%f",_numberLabel.viewOriginX,self.viewOriginY,_numberLabel.viewSizeWidth,_numberLabel.viewSizeHeight);
 
    self.animation = [[NumberAnimation alloc]init];
    self.animation.delegate = self;
    
    
}

-(void)show{
    self.animation.fromValue = @(0);
    self.animation.toValue = @(self.number);
    self.animation.duration = SHOW_DURATION;
    [self.animation startAnimation];
    
    [UIView animateWithDuration:SHOW_DURATION
                     animations:^{
                         self.alpha = 1.0f;
                        
                     }];
    [super show];
    
}
-(void)hide{
   
    self.animation.fromValue = @(self.number);
    self.animation.toValue = @(0);
    self.animation.duration = HIDE_DURATION;
    [self.animation startAnimation];
    [UIView animateWithDuration:HIDE_DURATION
                     animations:^{
                         self.alpha = 0.0f;
                       
                     }];
    [super hide];
    
}

#pragma mark - NumberAnimationDelegate
-(void)animation:(NumberAnimation *)animation ByCurrentNumber:(CGFloat)number{
    [self setNumberLabelNumber:number];
}

-(void)setNumberLabelNumber:(CGFloat)number{
    self.numberLabel.attributedText = [self.delegate accessNumber:number];
    
    if (self.AdjustNumberSize) {
        self.ViewSize = [self.numberLabel sizeThatFits:self.numberLabel.ViewSize];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
