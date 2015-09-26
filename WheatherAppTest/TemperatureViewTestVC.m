//
//  TemperatureViewTestVC.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/26.
//  Copyright © 2015年 ctd.leonard. All rights reserved.
//

#import "TemperatureViewTestVC.h"
#import "TemperatureView.h"
#import "UIColor+CustomColor.h"

@interface TemperatureViewTestVC ()

@property(nonatomic,strong) TemperatureView *temperatureView;
@property(nonatomic) BOOL didShow;
@end

@implementation TemperatureViewTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self addTemperatureViewToView];
    [self addButton];
    self.didShow = NO;
    /*
    UILabel *label = [[UILabel alloc]init];
    label.attributedText = [self accessNumber:20];
    label.center = self.view.viewInsideCenter;
    [label sizeToFit];
    [self.view addSubview: label];
    */
    
}

-(void)addTemperatureViewToView{
    self.temperatureView = [[TemperatureView alloc]init];
    self.temperatureView.temperature = 80.0f;
    //self.temperatureView.backgroundColor = [UIColor grayColor];
    
    self.temperatureView.layer.borderColor = [UIColor blackColor].CGColor;
    self.temperatureView.layer.borderWidth = 2.f;
    
    self.temperatureView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.temperatureView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.temperatureView
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.temperatureView
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                           constant:20.f+ 87]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.temperatureView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:nil
                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                        multiplier:1.0f
                                                           constant:175]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.temperatureView
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.temperatureView
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.f
                                                           constant:0]];
    [self.view layoutIfNeeded];
    [self.temperatureView buildView];
}
-(void)addButton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:@"Animation" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(animate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
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

}
-(IBAction)animate:(UIButton*)sender{
    if (!self.didShow) {
        [self.temperatureView show];
        self.didShow = YES;
    }else{
        [self.temperatureView hide];
        self.didShow = NO;
    }
}

#pragma mark - Test method
-(NSAttributedString *)accessNumber:(CGFloat)number{
    NSString *str = [NSString stringWithFormat:@"%2lu˚",(unsigned long)number];
    
    NSRange range = [str rangeOfString:str];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:str];
    [string addAttributes:@{
                            NSFontAttributeName:[UIFont fontWithName:@"Avenir" size:90],
                            NSForegroundColorAttributeName:[UIColor CustomBlueColor]
                            }
                    range:range];
    
    
    return string;
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
