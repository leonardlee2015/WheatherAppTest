//
//  WheatherView.h
//  WheatherAppTest
//
//  Created by 李南 on 15/9/16.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SetRect.h"

#define SHOW_DURATION 1.75f
#define HIDE_DURATION 0.75f
@protocol WheatherViewDelegate <NSObject>
@optional
/**
 *  @brief  additon animation will play while perform [WheatherView show].
 *
 *  @param view view that the animation is added to;
 */
-(void)additionShowAnimationToView:(UIView*)view;
/**
 *  @brief  additon animation will play while perform [WheatherView hide].
 *
 *  @param view view that the animation is added to;
 */
-(void)additionHideAnimationToView:(UIView*)view;

@end
@interface WheatherView : UIView
/**
 *  @brief  delegate
 */
@property (nonatomic,weak) id<WheatherViewDelegate> delegate;
/**
 *  @author ctd.leonard, 15-09-16 11:09:32
 *
 *  @abstract  initialize view's appearance. 
 *  @discussion after you create the view , you should run this methods before use it.If this view use autoLayout,run config constraints and run [layoutIfNeed] before this methods.
 *
 */

-(void)buildView;
/**
 *  @author ctd.leonard, 15-09-16 11:09:18
 *
 *  @abstract show the view with  animation effects.
 */
-(void)show;
/**
 *  @author ctd.leonard, 15-09-16 11:09:39
 *
 *  @abstract hide the view with  aniamtion effects.
 */
-(void)hide;
@end
