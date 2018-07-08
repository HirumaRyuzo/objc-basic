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
    
    // toolbarの表示をONにする
    [self.navigationController setToolbarHidden:NO animated:NO];

    // ボタン「Done」を生成する
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                               initWithTitle:@"Done" style: UIBarButtonItemStyleBordered
                               target:self action:@selector(Done)];

    // toolbarにボタンとラベルをセットする
    NSArray *items =
    [NSArray arrayWithObjects:button,nil];
    self.toolbarItems = items;
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
