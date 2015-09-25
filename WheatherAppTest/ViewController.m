//
//  ViewController.m
//  WheatherAppTest
//
//  Created by 李南 on 15/8/31.
//  Copyright (c) 2015年 ctd.leonard. All rights reserved.
//

#import "ViewController.h"
#import "EntryTBC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    EntryTBC *tbc  = [[EntryTBC alloc]initWithStyle:UITableViewStylePlain];
    tbc.tableView.frame =  self.view.bounds;
    
    [self.view addSubview:tbc.tableView];
    [self addChildViewController:tbc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
