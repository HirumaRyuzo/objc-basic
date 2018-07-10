//
//  ViewController.m
//  stv_project2.1.8
//
//  Created by 比留間龍三 on 2018/07/03.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *pickerData;
@end

@implementation ViewController
@synthesize pickerData;

- (void)viewDidLoad {
    [super viewDidLoad];
    //初期起動時ピッカーを隠す
    _characterPicker.hidden = YES;
    //初期起動時ツールバーを隠す
    _toolBar.hidden = YES;
    
    self.characterPicker.delegate = self;  // デリゲートを自分自身に設定
    self.characterPicker.dataSource = self;  // データソースを自分自身に設定

    pickerData = @[@"MickeyMouse", @"MinnieMouse", @"DonaldDuck", @"DaisyDuck", @"Goofy", @"Pluto", @"Duffy", @"ShellieMay"];

    //ラベルタップした時にピッカーとラベル表示
    UITapGestureRecognizer *labelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(appear)];
    _characterLabel.userInteractionEnabled = YES;
    [_characterLabel addGestureRecognizer:labelTap];
}

//Labelタップされた時のメソッド
-(void)appear{
    NSLog(@"labelタップされたよ");
    _characterPicker.hidden = NO;
    _toolBar.hidden = NO;
}

//Viewのタッチイベントを取る
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    switch (touch.view.tag) {
        case 1:
            // タグが1のビュー
            NSLog(@"Viewに触ったからピッカーとツールバー非表示");
            _characterPicker.hidden = YES;
            _toolBar.hidden = YES;
            break;
            //            default:
            //            // それ以外
            //            NSLog(@"View以外に触った");
            //            break;
    }
}

-(void)toolbarAction:(id)sender{
    NSLog(@"ツールバーです。");
}

//ピッカーで選択されたときに行う処理
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"aaaa");
    NSLog(@"選択=%@", pickerData [row]);
    NSLog(@"selected: %@", [pickerData  objectAtIndex:row]);
    //ラベルに表示
    _characterLabel.text = pickerData[row];
}

//-- LabelタップでPickerを非表示
- (void)characterLabel:(UITapGestureRecognizer *)sender{
    _characterPicker.hidden = NO;
}

- (IBAction)done:(id)sender {
    NSLog(@"Doneにタップされたのでピッカーとツールバー非表示");
    _characterPicker.hidden = YES;
    _toolBar.hidden = YES;
}

//列数
- (NSInteger) numberOfComponentsInPickerView : ( UIPickerView   * ) pickerView{
    return   1 ;
}

//行数
- (NSInteger) pickerView : ( UIPickerView   * ) pickerView  numberOfRowsInComponent : ( NSInteger ) component{
    return pickerData . count ;
}

// The data to return for the row and component (column) that's being passed in
- (NSString * ) pickerView : ( UIPickerView   * ) pickerView  titleForRow : ( NSInteger ) row  forComponent : ( NSInteger ) component{
    return   pickerData [ row ] ;
}


@end
