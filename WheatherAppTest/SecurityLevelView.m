//
//  SecurityLevelView.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/15.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "SecurityLevelView.h"
#import "UIColor+CustomColor.h"

@interface SecurityLevelView ()
@property (nonatomic,strong) UIView *levelIndicateView;
@end
@implementation SecurityLevelView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    // 设置 view 外观
    self.backgroundColor = [UIColor whiteColor];
    
    _securityLevel = PasswardSecurityLevelNone;
    // create and config _levelIndicateView
    _levelIndicateView = [[UIView alloc]init];
    _levelIndicateView.backgroundColor = [self colorForLevel:_securityLevel];
    _levelIndicateView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:_levelIndicateView];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_levelIndicateView
                                                    attribute:NSLayoutAttributeHeight
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeHeight
                                                   multiplier:1.0f
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_levelIndicateView
                                                    attribute:NSLayoutAttributeWidth
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeWidth
                                                   multiplier:[self mutiplerForLevel:_securityLevel]
                                                     constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_levelIndicateView
                                                    attribute:NSLayoutAttributeLeft
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeLeft
                                                   multiplier:1.0f
                                                      constant:0.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_levelIndicateView
                                                    attribute:NSLayoutAttributeTop
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeTop
                                                   multiplier:1.0f
                                                      constant:0.f]];
    
}



#pragma mark - animation
-(void)setSecurityLevel:(PasswardSecurityLevel)securityLevel{
    _securityLevel = securityLevel;
    
    [self animationIndicateViewWithSecurityLevel:securityLevel];
}

-(void)animationIndicateViewWithSecurityLevel:(PasswardSecurityLevel)level{
    [self.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint* obj, NSUInteger idx, BOOL *stop) {
        if (obj.firstAttribute == NSLayoutAttributeWidth) {
            *stop = YES;
            [self removeConstraint:obj];
        }
    }];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_levelIndicateView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:[self mutiplerForLevel:_securityLevel]
                                                      constant:0.f]];
    
    
    [UIView animateWithDuration:0.3
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0.7
                        options:0
                     animations:^{
                         [self layoutIfNeeded];
                         _levelIndicateView.backgroundColor = [self colorForLevel:level];
                     }
                     completion:nil];
}
-(CGFloat)mutiplerForLevel:(PasswardSecurityLevel)level{
    CGFloat mutipler;
    switch (level) {
        case PasswardSecurityLevelNone:
            mutipler = 0.f;
            break;
        case PasswardSecurityLevelLow:
            mutipler = 0.35f;
            break;
        case PasswardSecurityLevelMiddle:
            mutipler = 0.75f;
            break;
        case PasswardSecurityLevelHigh:
            mutipler = 1.0f;
            break;
        default:
            break;
    }
    return mutipler;
}
-(UIColor *)colorForLevel:(PasswardSecurityLevel)level{
    UIColor *color;
    switch (level) {
        case PasswardSecurityLevelNone:
            color = [UIColor  whiteColor];
            break;
        case PasswardSecurityLevelLow:
            color = [UIColor  customRedColor];
            break;
        case PasswardSecurityLevelMiddle:
            color = [UIColor  customYellowColor];
            break;
        case PasswardSecurityLevelHigh:
            color = [UIColor  customGreenColor];
            break;
        default:
            break;
    }
    return color;
}
@end
