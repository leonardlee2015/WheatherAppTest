//
//  MediaTimeFunctionDisplayVC.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/25.
//  Copyright © 2015年 ctd.leonard. All rights reserved.
//

#import "MediaTimeFunctionDisplayVC.h"
#import "UIView+SetRect.h"

@interface MediaTimeFunctionDisplayVC ()

@end

@implementation MediaTimeFunctionDisplayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBezierPathView];
}

-(void)addBezierPathView{
    UIView *bezierPathView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 250, 250)];
    bezierPathView.center = self.view.center;
    [self.view addSubview:bezierPathView];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addCurveToPoint:CGPointMake(1.0, 1.0) controlPoint1:CGPointMake(0.69, 0.11) controlPoint2:CGPointMake(0.32, 0.88)];
    [path applyTransform:CGAffineTransformMakeScale(250, 250)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 4.0f;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    
    [bezierPathView.layer addSublayer:layer];
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
