//
//  MoveTitleLabel.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/23.
//  Copyright © 2015年 ctd.leonard. All rights reserved.
//

#import "MoveTitleLabel.h"
#import "UIView+SetRect.h"
#import <pop/POP.h>

@interface MoveTitleLabel (){
    CGPoint _startPositon;
    CGPoint _midPosition;
    CGPoint _endPosition;
}
@property (nonatomic,strong) UILabel *titleLabel;
@end
@implementation MoveTitleLabel

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)buildView{
    
    // 创建并配置 _titleLabel
    _titleLabel = [[UILabel alloc]initWithFrame:self.bounds];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    if (self.title) {
        _titleLabel.text = self.title;
        
    }
    if (self.attributedTitle) {
        _titleLabel.attributedText = self.attributedTitle;
    }
    if (self.font) {
        _titleLabel.font = self.font;
    }
    [_titleLabel sizeToFit];
    
    [self addSubview:_titleLabel];
    
    // 根据 _titleLabel 重设 MoveTitleLabel size.
    self.viewSizeWidth = _titleLabel.viewSizeWidth;
    self.viewSizeHeight = _titleLabel.viewSizeHeight;
    
    
    // 预设动画 属性
    
    _midPosition = self.center;
    _startPositon = CGPointMake(_midPosition.x-self.offset.x,_midPosition.y-self.offset.y);
    _endPosition = CGPointMake(_midPosition.x+self.offset.x, _midPosition.y+self.offset.y);
    
    self.alpha = 0.f;
    self.center = _startPositon;
}

#pragma mark - animation.
-(void)show{
    POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    animation.fromValue = [NSValue valueWithCGPoint:_startPositon];
    animation.toValue = [NSValue valueWithCGPoint:_midPosition];
    animation.duration = SHOW_DURATION;
    
    [self pop_addAnimation:animation forKey:@"titleShowAnimationKey"];
    
    [UIView animateWithDuration:SHOW_DURATION
                     animations:^{
                         self.alpha = 1.0f;
                     }];
}
-(void)hide{
    POPBasicAnimation *centerAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    centerAnimation.fromValue = [NSValue valueWithCGPoint:_midPosition];
    centerAnimation.toValue = [NSValue valueWithCGPoint:_endPosition];
    centerAnimation.duration = HIDE_DURATION;
    centerAnimation.completionBlock = ^(POPAnimation *anim,BOOL finish){
        self.center = _startPositon;
    };
    
    POPBasicAnimation *alpaAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alpaAnimation.fromValue = @(1.0f);
    alpaAnimation.toValue = @(0.0f);
    alpaAnimation.duration = HIDE_DURATION;
    
    [self pop_addAnimation:centerAnimation forKey:@"titleCeneterHideAnimationKey"];
    [self pop_addAnimation:alpaAnimation forKey:@"titleAplaAnimationKey"];
    
}
#pragma mark - Properties.

-(void)setTitle:(NSString *)title{
    _title = title;
    if (self.titleLabel) {
        self.titleLabel.text = title;
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
