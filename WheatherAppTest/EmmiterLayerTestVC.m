//
//  EmiiterLayerTestVC.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/9.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "EmmiterLayerTestVC.h"
#import "EmmiterView.h"

@interface EmmiterLayerTestVC ()
@property (nonatomic,strong) EmmiterView *pirtcileEmmitter;
@property (nonatomic,strong) CAEmitterLayer *emitterLayer;
@end
@implementation EmmiterLayerTestVC
-(void)viewDidLoad{
    self.view.backgroundColor = [UIColor whiteColor];
    self.pirtcileEmmitter = [[EmmiterView alloc] initWithFrame:self.view.frame];
    [self.view addSubview: self.pirtcileEmmitter];
    /*
    _emitterLayer = [CAEmitterLayer layer];
    _emitterLayer.frame =  self.view.frame;
    [self LayerSetup];
    [self.view.layer addSublayer:_emitterLayer];
    */
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.pirtcileEmmitter show];
    
}

-(void)LayerSetup{
#if 0
    _emitterLayer.emitterShape = kCAEmitterLayerLine; // particle emmiter shape
    _emitterLayer.emitterPosition = CGPointMake(self.view.bounds.size.width/2.0f, self.view.bounds.size.height/2.0f); // particles emmiter origins
    _emitterLayer.emitterSize = self.view.frame.size; // particle emmiter size;
    _emitterLayer.emitterMode = kCAEmitterLayerSurface;
    
#endif
    self.emitterLayer.emitterShape    = kCAEmitterLayerLine;                            // 直线粒子发射器
    self.emitterLayer.emitterMode     = kCAEmitterLayerSurface;                         // ?????
    self.emitterLayer.emitterSize     = self.view.frame.size;                                // 发射区域
    self.emitterLayer.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.f, - 5); // 发射中心点位置
    
    
    
    
}

-(void)show{
#if 1
    //self.backgroundColor = [UIColor lightGrayColor];
    CAEmitterCell *emiterCell = [CAEmitterCell emitterCell];
    UIImage *image = [UIImage imageNamed:@"rain"];
    emiterCell.contents = (__bridge id)image.CGImage;
    emiterCell.color = [UIColor blackColor].CGColor;
    emiterCell.scale = 0.2f;
    emiterCell.scaleRange = 0.5f;
    emiterCell.yAcceleration = 10;
    //emiterCell.scaleSpeed = 0.15f;
    emiterCell.name = @"rain";
    emiterCell.lifetime = 60.0f;
    emiterCell.birthRate = 10;
    emiterCell.velocity = 10.0f;
    //emiterCell.emissionRange
    _emitterLayer.emitterCells = [NSArray arrayWithObject:emiterCell];
    
    //self.alpha = 1.0f;
    
#else
    UIImage *rainImage = [UIImage imageNamed:@"rain"];
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    // 粒子的名字
    snowflake.name = @"snow";
    
    // 粒子参数的速度乘数因子
    snowflake.birthRate =1.f;
    
    // 粒子生命周期
    snowflake.lifetime =  60;
    
    // 粒子速度
    snowflake.velocity = 10.f;
    
    // 粒子的速度范围
    snowflake.velocityRange = 10.f;
    
    // 粒子y方向的加速度分量(可以理解为重力)
    snowflake.yAcceleration = 2.f;
    
    // 每个发射的粒子的初始时候随机的角度
    snowflake.emissionRange = 0.5f * M_PI;
    
    // 获取图片
    snowflake.contents = (id)rainImage.CGImage;
    
    // 设置雪花形状的粒子的颜色
    snowflake.color = [UIColor blackColor].CGColor;
    
    // 尺寸
    snowflake.scale = 0.2;
    
    // 尺寸变化范围
    snowflake.scaleRange = 0.3f;
    
    // 添加粒子
    self.emitterLayer.emitterCells = @[snowflake];
#endif
    
}
@end
