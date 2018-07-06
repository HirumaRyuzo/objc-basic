//
//  ViewController.m
//  stv_project2.1.7
//
//  Created by 比留間龍三 on 2018/07/03.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // キーボードが表示：消す
    if (self.textField.isFirstResponder) {
        //[_searchField resignFirstResponder];
        [self.view endEditing:YES];   // こちらでもOK
    }
    // キーボードが非表示：表示する
    else {
        [self.textField becomeFirstResponder];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //プレースホルダー
    self.textField.placeholder = @"文字列を入力してください。";
    self.textField.delegate = self;
    //textFieldに入力後enterキーでキーボード非表示するのはデフォルトでなるのでここにあると最初に消してしまう
//    [self.view endEditing:YES];
    //textFieldが空の時にenterキー非活性化（ストーリーボードで”Auto-enable Return Key”みつからず）
    self.textField.enablesReturnKeyAutomatically = YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    // 最大入力文字数
    int maxInputLength = 30;
    // 入力済みのテキストを取得
    NSMutableString *str = [textField.text mutableCopy];
    // 入力済みのテキストと入力が行われたテキストを結合
    [str replaceCharactersInRange:range withString:string];
    
    if ([str length] > maxInputLength) {
        // ※ここに文字数制限を超えたことを通知する処理を追加
        return NO;
    }
    return YES;
}
@end
