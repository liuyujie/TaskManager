//
//  ViewController.m
//  TaskManager
//
//  Created by hupeng on 15-1-26.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import "ViewController.h"
#import "HPTaskCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [HPTaskCenter defaultCenter];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
