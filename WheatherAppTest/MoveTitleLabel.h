//
//  MoveTitleLabel.h
//  WheatherAppTest
//
//  Created by 李南 on 15/9/23.
//  Copyright © 2015年 ctd.leonard. All rights reserved.
//

#import "WheatherView.h"


@interface MoveTitleLabel : WheatherView

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSAttributedString *attributedTitle;
@property (nonatomic,strong) UIFont *font;

@property (nonatomic) CGPoint startOffset;
@property (nonatomic) CGPoint endOffset;
@end
