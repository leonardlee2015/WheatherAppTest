//
//  HumidityViewTestVC.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/16.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "HumidityViewTestVC.h"
#import "HumidityView.h"
#import "CycleView.h"
#import "NumberView.h"
#import "MoveTitleLabel.h"
#import "UIView+SetRect.h"

@interface HumidityViewTestVC ()<CycleViewDelegate>
@property (nonatomic ,strong) HumidityView * humidityView;

@end

@implementation HumidityViewTestVC{
    CycleView *_cycleView;
    NumberView *numberView;
    BOOL cycleViewDidShow;
    MoveTitleLabel *titleLabel;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addCycleView];
    cycleViewDidShow = NO;
    
    [self addButton];
    [self addNumberView];
    
    [self addTitleLabel];
    
}
-(IBAction)rotate:(UIButton*)sender{
    if (cycleViewDidShow) {
        [_cycleView hide];
        [numberView hide];
        [titleLabel hide];
        cycleViewDidShow = NO;
    }else{
        [_cycleView show];
        [numberView show];
        [titleLabel show];
        
        cycleViewDidShow = YES;
    }
}

-(void)addButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"ROTATION" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:button];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTopMargin
                                                         multiplier:1
                                                           constant:200]];
}

-(void)addCycleView{
    _cycleView = [[CycleView alloc]init];
    //cycleView.backgroundColor = [UIColor colorWithWhite:0 alpha:1.0];
    _cycleView.lineWidth = 4;
    //cycleView.baseStokeEnd = 0.5f;
    

    [self.view addSubview:_cycleView];
    [self addConstraintsForView:_cycleView];
    
    [_cycleView buildView];
    
    //cycleView.delegate = self;
    _cycleView.percent = 80;
    


    
    
}

-(void)addNumberView{
    numberView  = [[NumberView alloc]initWithNumber:80];
    
    [self.view addSubview:numberView];
    [self addConstraintsForView:numberView];
    [numberView buildView];

}
-(void)addConstraintsForView:(UIView*)view{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0f
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0f
                                                           constant:150]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0f
                                                           constant:0.f]];
    [self.view layoutIfNeeded];
    
}

-(void)addTitleLabel{
    titleLabel = [[MoveTitleLabel alloc]initWithFrame:CGRectMake(self.view.viewCenterX-150, self.view.viewCenterY+200, self.view.viewSizeWidth, 100)];
    titleLabel.title = @"dsafafafdafadfa";
    titleLabel.offset = CGPointMake(50, 0);
    
    [self.view addSubview:titleLabel];
    [titleLabel buildView];
}
#pragma mark - CycleViewDelegate
-(void)CycleViewPositionShowAnimation{
    [self.view.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.firstAttribute == NSLayoutAttributeCenterX && obj.firstItem == _cycleView) {
            [self.view removeConstraint:obj];
            *stop = YES;
        }
    }];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_cycleView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f
                                                           constant:0]];
    [UIView animateWithDuration:SHOW_DURATION animations:^{
        [self.view layoutIfNeeded];
    }];
    
}
-(void)CycleViewPositionHideAnimation{
    [self.view.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.firstAttribute == NSLayoutAttributeCenterX && obj.firstItem == _cycleView) {
            [self.view removeConstraint:obj];
            *stop = YES;
        }
    }];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_cycleView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f
                                                           constant:-self.view.center.x]];
    [UIView animateWithDuration:HIDE_DURATION animations:^{
        [self.view layoutIfNeeded];
    }];
}
@end