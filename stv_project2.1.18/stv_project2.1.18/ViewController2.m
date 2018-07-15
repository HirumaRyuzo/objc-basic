//
//  ViewController2.m
//  stv_project2.1.18
//
//  Created by 比留間龍三 on 2018/07/15.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"

@interface ViewController2 ()
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)backPop:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}
@end
