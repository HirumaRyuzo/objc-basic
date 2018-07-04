//
//  ViewController.m
//  stv_project2.1.9
//
//  Created by 比留間龍三 on 2018/07/04.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
   }

- (IBAction)changeDate:(id)sender {
    //初期化
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    //日付のフォーマット指定
    df.dateFormat = @"yyyy/MM/dd HH:mm";
    //ラベルに日付を表示
    self.dateLabel.text = [df stringFromDate:self.myDatePicker.date];
}

@end
