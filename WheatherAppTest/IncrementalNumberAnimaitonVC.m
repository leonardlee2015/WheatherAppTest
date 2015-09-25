//
//  IncrementalNumberAnimaitonVC.m
//  WheatherAppTest
//
//  Created by 李南 on 15/9/1.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "IncrementalNumberAnimaitonVC.h"
#import "UIViewController+InputAccessoryFunction.h"

@interface IncrementalNumberAnimaitonVC ()

@property (nonatomic, strong) CADisplayLink *timer;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (nonatomic) NSUInteger toValue;
@property (nonatomic) NSTimeInterval duration;
@property (nonatomic) NSTimeInterval timeOffset;
@property (nonatomic) NSTimeInterval lastStep;
@end

@implementation IncrementalNumberAnimaitonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addAccessViewToTextField:_numberTextField];
    
    [self.numberTextField addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [_timer invalidate];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (object == _numberTextField && [keyPath isEqualToString:@"text"]) {
        _numberLabel.text = change[NSKeyValueChangeNewKey];
    }
}

#pragma mark - animation
- (IBAction)startAnimation:(id)sender {
    _startButton.enabled = NO;
    // initialize aniamtion value.
    _toValue = [_numberLabel.text  intValue];
    _timeOffset = 0.0f;
    _duration = 1.75f;
    
    // if timer exist, romove it from main run loop.
    [self.timer invalidate];
    
    _lastStep = CACurrentMediaTime();
    
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(step:)];
    [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}

-(void)step:(CADisplayLink*)timer{
    // get now media time;
    NSTimeInterval thisStep = CACurrentMediaTime();
    NSTimeInterval stepDuration = thisStep - _lastStep;
    _lastStep = thisStep;
    
    self.timeOffset = MIN(self.timeOffset+stepDuration, self.duration);
    
    CGFloat nowTime = self.timeOffset / self.duration;
    NSLog(@"before nowTime :%f", nowTime);
    nowTime =    QuadraticEaseOut(nowTime);
    
    NSLog(@"before nowTime :%f", nowTime);
    int currentNumber =  self.toValue * nowTime;
    NSLog(@"currentNumber :%d", currentNumber);
    self.numberLabel.text = [NSString stringWithFormat:@"%02d",currentNumber];
    if (currentNumber == _toValue) {
        [self.timer invalidate];
        _startButton.enabled = YES;
    }
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
