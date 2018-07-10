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
    //初期起動時ピッカーを隠す
    _datePicker.hidden = YES;
    //初期起動時ラベルを隠す
    _toolBar.hidden = YES;
    
    //ラベルタップした時にピッカーとラベル表示
    UITapGestureRecognizer *labelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(appear)];
    _dateLabel.userInteractionEnabled = YES;
    [_dateLabel addGestureRecognizer:labelTap];
}

//Labelタップされた時のメソッド
-(void)appear{
    NSLog(@"labelタップされたよ");
    _datePicker.hidden = NO;
    _toolBar.hidden = NO;
}

//Viewのタッチイベントを取る
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    switch (touch.view.tag) {
        case 1:
            // タグが1のビュー
            NSLog(@"Viewに触ったからピッカーとツールバー非表示");
            _datePicker.hidden = YES;
            _toolBar.hidden = YES;
            break;
//            default:
//            // それ以外
//            NSLog(@"View以外に触った");
//            break;
    }
}

//DatePickerを操作した
- (IBAction)changeDate:(id)sender {
    //初期化
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //日付のフォーマット指定
    dateFormatter.dateFormat = @"yyyy/MM/dd HH:mm";
    //ラベルに日付を表示
    self.dateLabel.text = [dateFormatter stringFromDate:self.datePicker.date];
}
//Doneボタンタップされた時の動作
- (IBAction)done:(id)sender {
    NSLog(@"Doneにタップされたのでピッカーとツールバー非表示");
    _datePicker.hidden = YES;
    _toolBar.hidden = YES;
}

@end
