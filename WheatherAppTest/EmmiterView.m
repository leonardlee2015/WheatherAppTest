//
//  EmmiterView.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/9.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "EmmiterView.h"

@interface EmmiterView ()

@end
@implementation EmmiterView

+(Class)layerClass{
    return [CAEmitterLayer class];
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _emitterLayer = (CAEmitterLayer*) self.layer;
        [self LayerSetup];
    }
    return self;
}
-(void)awakeFromNib{
    _emitterLayer = (CAEmitterLayer *) self.layer;
    [self LayerSetup];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _emitterLayer = (CAEmitterLayer *) self.layer;
        [self LayerSetup];
    }
    return self;
}

-(void)LayerSetup{
    _emitterLayer.emitterShape = kCAEmitterLayerRectangle; // particle emmiter shape
    _emitterLayer.emitterPosition = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.width/2.0f); // particles emmiter origins
    _emitterLayer.emitterSize = self.frame.size; // particle emmiter size;
    _emitterLayer.emitterMode = kCAEmitterLayerSurface;
    
    self.alpha = 0.0f;

    
    
    
}

-(void)show{
    self.backgroundColor = [UIColor lightGrayColor];
    CAEmitterCell *emiterCell = [CAEmitterCell emitterCell];
    
    emiterCell.contents = (__bridge id)[UIImage imageNamed:@"snow"].CGImage;
    emiterCell.color = [UIColor blackColor].CGColor;
    emiterCell.scale = 0.8f;
    //emiterCell.scaleRange = 0.4f;
    //emiterCell.scaleSpeed = 0.05f;
    
    emiterCell.lifetime = 60.0f;
    emiterCell.birthRate = 5;
    emiterCell.velocity = 5.0f;
    emiterCell.velocityRange = 30.0f;
    //emiterCell.yAcceleration = 10.0f;
    
    
    
    //emiterCell.emissionRange
    _emitterLayer.emitterCells = [NSArray arrayWithObject:emiterCell];
    
    
     [UIView animateWithDuration:1.75f animations:^{
        self.alpha = 0.5f;
    }];
    
    
}
-(void)hide{
    [UIView animateWithDuration:0.75f animations:^{
        self.alpha = 0.0f;
    }];
}
@end
