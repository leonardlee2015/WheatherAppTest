//
//  HumidityViewTotalTestVC.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/24.
//  Copyright © 2015年 ctd.leonard. All rights reserved.
//

#import "HumidityViewTotalTestVC.h"
#import "HumidityView.h"
#import "UIView+SetRect.h"

@interface HumidityViewTotalTestVC ()
@property(nonatomic,strong) HumidityView *humidityView;
@property(nonatomic) BOOL humidityViewShow;
@end

@implementation HumidityViewTotalTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self addHumidityView];
    [self addButton];
    self.humidityViewShow = NO;
}

-(void)addHumidityView{
    self.humidityView = [[HumidityView alloc]init];
    self.humidityView.translatesAutoresizingMaskIntoConstraints = NO;
    self.humidityView.layer.borderColor = [UIColor grayColor].CGColor;
    self.humidityView.layer.borderWidth = 2.0f;
    self.humidityView.Humidity = 70;
    [self.view addSubview:self.humidityView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.humidityView
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0f
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.humidityView
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                           constant:10+86]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.humidityView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                        multiplier:1.0f
                                                           constant:self.view.viewSizeWidth/2]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.humidityView
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                             toItem:self.humidityView
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0f
                                                           constant:0]];
    [self.view layoutIfNeeded];
    [self.humidityView buildView];
    
}

-(void)addButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Animation" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(animateHumidityView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                           constant:-40]];
    [self.view layoutIfNeeded];
}
-(IBAction)animateHumidityView:(UIButton*)sender{
    if (!self.humidityViewShow) {
        [self.humidityView show];
        self.humidityViewShow = YES;
    }else{
        [self.humidityView hide];
        self.humidityViewShow = NO;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
