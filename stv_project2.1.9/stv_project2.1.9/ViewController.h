//
//  ViewController.h
//  stv_project2.1.9
//
//  Created by 比留間龍三 on 2018/07/04.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//ラベルを定義
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
//DatePickerを定義
@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;
//DatePickerを操作した時のイベントを定義
- (IBAction)changeDate:(id)sender;

@end

