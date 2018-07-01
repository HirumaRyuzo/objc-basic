//
//  ViewController.m
//  stv_project2.1.4
//
//  Created by 比留間龍三 on 2018/06/30.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)alert:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"タイトル" message:@"メッセージ" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"はい" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // 「はい」ボタンが押された時の処理
        [self otherButtonPushed];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"いいえ" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // 「いいえ」ボタンが押された時の処理
        [self cancelButtonPushed];
    }]];
    // 画面に表示します
    [self presentViewController:alertController animated:YES completion:nil];
}

// アラートのはいボタン押下処理
- (void)otherButtonPushed {
    NSLog(@"はい！");
}

// アラートのいいえボタン押下処理
- (void)cancelButtonPushed {
    NSLog(@"いいえ！");
}

@end
