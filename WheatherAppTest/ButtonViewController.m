//
//  ButtonViewController.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/10.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "ButtonViewController.h"
#import "FlatButton.h"
#import "UIColor+CustomColor.h"
#import <pop/POP.h>

@interface ButtonViewController ()<POPAnimationDelegate>
@property (nonatomic,strong)FlatButton *button;
@property (nonatomic,strong)UIButton *addButton;
@property (nonatomic) CGPoint lastPosition;
@end
@implementation ButtonViewController
#pragma mark - initialization
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addFlatButton];
    [self addAddButton];
    self.lastPosition  = _addButton.layer.position;
    
}

-(void)addFlatButton{
    self.button = [FlatButton button];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.button setTitle:@"Log in" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor CustomBlueColor];
    //self.button.frame = CGRectMake(100, 100, 200, 100);
    
    [self.view addSubview:self.button];
    [_button addTarget:self action:@selector(changeLabel:) forControlEvents:UIControlEventTouchUpInside];
    //[self.button sizeToFit];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.button
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f
                                                           constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.button
                                                          attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0f
                                                           constant:0.0f]];
}
-(void)addAddButton{
    // create add mode button;
    _addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    _addButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_addButton addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addButton];

    // set constraint.
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_addButton
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1.0f
                                                            constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_addButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTopMargin
                                                         multiplier:1.0f
                                                           constant:200.0f]];
    
    
}

#pragma mark - Action.
-(IBAction)rotate:(id)sender{
    static CGFloat angel = 0;
    static int count = 0;
    count++;
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    //angel += M_PI_4;
    angel = angel==M_PI? M_PI_4: angel+M_PI_4;
    anim.toValue = @(angel);
    //anim.removedOnCompletion = YES;
    
    [_addButton.layer pop_addAnimation:anim forKey:@"RotateAnimationKey"];
}

-(IBAction)changeLabel:(id)sender{
    [self shakeButton];
}

#pragma mark - animation.
-(void)shakeButton{
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//anim.toValue = @(_button.layer.position.x + 10);
    anim.name = @"SB";
    anim.delegate = self;
    anim.velocity = @(2000);
    anim.springBounciness = 20;
    
    [_button.layer pop_addAnimation:anim forKey:@"shakeAnimationKey"];
}
#pragma mark - POPAnimationDelegate
-(void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished{
    if ([anim.name isEqualToString:@"SB"]) {
        [_button pop_removeAnimationForKey:@"shakeAnimationKey"];
        _addButton.layer.position = self.lastPosition;
    }
}
@end
