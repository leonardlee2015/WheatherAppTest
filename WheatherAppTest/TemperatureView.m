//
//  TemperatureView.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/26.
//  Copyright © 2015年 ctd.leonard. All rights reserved.
//

#import "TemperatureView.h"
#import "UIColor+CustomColor.h"
#import "MoveTitleLabel.h"


@interface TemperatureView () 
@property(nonatomic,strong) NumberView *numberView;
@property(nonatomic,strong) MoveTitleLabel *titleLabel;
@end
@implementation TemperatureView
@dynamic delegate;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)buildView{
    // create titleLabel
    self.titleLabel = [[MoveTitleLabel alloc]initWithFrame:CGRectMake(20, 10, 0, 0)];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]
                                      initWithString:@"Temperature"
                                      attributes:@{
                                                   NSFontAttributeName:[UIFont fontWithName:@"Avenir-Light" size:19],
                                                   NSForegroundColorAttributeName: [UIColor colorWithWhite:0.3 alpha:1.0f]
                                                   }];
    self.titleLabel.attributedTitle = str;
    self.titleLabel.startOffset = CGPointMake(-30,0);
    self.titleLabel.endOffset = CGPointMake(30, 0);
    [self addSubview:self.titleLabel];
    [self.titleLabel buildView];
    
    // create numberView;
    [self createNumberView];

    
    
}

-(void)createNumberView{
    self.numberView = [[NumberView alloc]initWithNumber:self.temperature];
    self.numberView.translatesAutoresizingMaskIntoConstraints = NO;
    self.numberView.AdjustNumberSize = YES;
    
    self.numberView.delegate  = self;

    [self addSubview:self.numberView];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.numberView
                                                    attribute:NSLayoutAttributeCenterX
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeCenterX
                                                   multiplier:1.0f
                                                      constant:10.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.numberView
                                                    attribute:NSLayoutAttributeCenterY
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeCenterY
                                                   multiplier:1.f
                                                      constant:10.f]];
    
    [self.numberView buildView];
}
-(void)show{
    [self.numberView show];
    [self.titleLabel show];
    
    self.alpha = 0.0f;
    
    [UIView animateWithDuration:SHOW_DURATION animations:^{
        self.alpha = 1.0f;
    }];
}

-(void)hide{
    [self.numberView hide];
    [self.titleLabel hide];
    
    [UIView animateWithDuration:HIDE_DURATION animations:^{
        self.alpha = 0.f;
    }];
}
#pragma mark - NumberViewDelegate
-(NSAttributedString *)accessNumber:(CGFloat)number{
    NSString *str = [NSString stringWithFormat:@"%2lu˚",(unsigned long)number];

    NSRange range = [str rangeOfString:str];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:str];
    [string addAttributes:@{
                            NSFontAttributeName:[UIFont fontWithName:@"Avenir-Light" size:90],
                            NSForegroundColorAttributeName:[UIColor CustomBlueColor]
                            }
                    range:range];
    
     
    return string;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
