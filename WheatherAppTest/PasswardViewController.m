//
//  PasswardViewController.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/15.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "PasswardViewController.h"
#import "SecurityLevelView.h"



@interface PasswardViewController ()
@property (nonatomic, strong) SecurityLevelView *levelView;
@property (nonatomic, strong) UITextField *textField;
@end
@implementation PasswardViewController
#pragma mark - initialzation.
-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // create textField and security level view .
    [self addTextField];
    [self addSecurityLevelIndicateView];
    //[self addtextView];
    
    
}
-(void)addTextField{
    // initial textfield
    _textField = [[UITextField alloc]init];
    _textField.secureTextEntry = YES;
    _textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    _textField.leftViewMode = UITextFieldViewModeAlways;
    _textField.placeholder = @"Enter Passward";
    _textField.textAlignment = NSTextAlignmentCenter;
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_textField];
    [_textField addTarget:self action:@selector(textFieldEndEdit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    //[_textField becomeFirstResponder];
    // add constraints
    _textField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_textField
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f
                                                           constant:0 ]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_textField
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                           constant:-5.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_textField
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0f
                                                          constant:-40]];
    
    
}

-(void)addSecurityLevelIndicateView{
    _levelView = [[SecurityLevelView alloc]init];
    [self.view addSubview:_levelView];
    _levelView.translatesAutoresizingMaskIntoConstraints = NO;
    // add constraints
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_levelView
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                          constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_levelView
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_textField
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0f constant:5.0f]];
/*
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_levelView
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeLeadingMargin
                                                        multiplier:1.0f
                                                          constant:0.f]];
 */
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_levelView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_textField
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0f
                                                           constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_levelView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0f
                                                           constant:10]];
    
}


-(IBAction)textFieldDidChange:(UITextField*)sender{
    if (sender.text.length >= 8 ) {
        _levelView.securityLevel = PasswardSecurityLevelHigh;
        
    }else if (sender.text.length  >= 4){
        _levelView.securityLevel = PasswardSecurityLevelMiddle;
    }else{
        _levelView.securityLevel = PasswardSecurityLevelLow;
    }
}
-(IBAction)textFieldEndEdit:(UITextField*)sender{
    [sender resignFirstResponder];
}
@end
