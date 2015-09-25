//
//  SecurityLevelView.h
//  WheatherAppTest
//
//  Created by 李南 on 15/9/15.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PasswardSecurityLevel) {
    PasswardSecurityLevelNone,
    PasswardSecurityLevelLow,
    PasswardSecurityLevelMiddle,
    PasswardSecurityLevelHigh
};

@interface SecurityLevelView : UIView
@property (nonatomic,assign) PasswardSecurityLevel securityLevel;
@end
