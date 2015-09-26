//
//  UIView+SetRect.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/1.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "UIView+SetRect.h"

@implementation UIView (SetRect)
-(CGPoint)ViewOrigin{
    return self.frame.origin;
}
-(void)setViewOrigin:(CGPoint)ViewOrigin{
    
    self.frame = CGRectMake(ViewOrigin.x, ViewOrigin.y,CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

-(CGSize)ViewSize{
    return self.frame.size;
}
-(void)setViewSize:(CGSize)ViewSize{
    self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), ViewSize.width, ViewSize.height);
}

-(CGFloat)viewOriginX{
    return self.frame.origin.x;

}
-(void)setViewOriginX:(CGFloat)viewOriginX{
    
    self.frame = CGRectMake(viewOriginX, self.viewOriginY, self.viewSizeWidth, self.viewSizeHeight  );
}

-(CGFloat)viewOriginY{
    return self.frame.origin.y;
}
-(void)setViewOriginY:(CGFloat)viewOriginY{
    self.frame = CGRectMake(self.viewOriginX, viewOriginY, self.viewSizeWidth, self.viewSizeHeight);
    
}

-(CGFloat)viewSizeWidth{
    return self.frame.size.width;
}
-(void)setViewSizeWidth:(CGFloat)viewSizeWidth{
    self.frame = CGRectMake(self.viewOriginX, self.viewOriginY, viewSizeWidth, self.viewSizeHeight);
}

-(CGFloat)viewSizeHeight{
    return self.frame.size.height;
}
-(void)setViewSizeHeight:(CGFloat)viewSizeHeight{
    self.frame = CGRectMake(self.viewOriginX, self.viewOriginY, self.viewSizeWidth
                            , viewSizeHeight);
}
-(CGFloat)viewCenterX{
    return self.center.x;
}
-(void)setViewCenterX:(CGFloat)viewCenterX{
    self.center = CGPointMake(viewCenterX, self.viewCenterY);
}
-(CGFloat)viewCenterY{
    return self.center.y;
}
-(void)setViewCenterY:(CGFloat)viewCenterY{
    self.center = CGPointMake(self.viewCenterX, viewCenterY);
}
-(CGPoint)viewInsideCenter{
    return CGPointMake(self.viewSizeWidth/2, self.viewSizeHeight/2);
}

@end
