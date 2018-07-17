//
//  ViewController.m
//  stv_project2.2.1
//
//  Created by 比留間龍三 on 2018/07/16.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"
#import "DataSaveHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataSaveHelper *helper = [DataSaveHelper new];
    
    if (helper.initialized) {
        NSLog(@"初回起動時の初期化は済んでいます");
    } else {
        helper.initialized = YES;
        // 初回起動時の初期化処理など
    }
    
    helper.howManyTimesAppLaunched ++;
    NSLog(@"%ld", helper.howManyTimesAppLaunched);
}
@end
