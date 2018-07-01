//
//  ViewController.m
//  stv_project2.1.5
//
//  Created by 比留間龍三 on 2018/07/01.
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
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"選択" message:@"どれにしますか？" preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 上から順にボタンが配置
    [alertController addAction:[UIAlertAction actionWithTitle:@"Facebook" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self selectedActionWith:1];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"twitter" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self selectedActionWith:2];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"LINE" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self selectedActionWith:3];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"クリア" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self selectedActionWith:0];
    }]];
    
//    iPad用　（これが無いとエラー）
//    alertController.popoverPresentationController.sourceView = self.view;
//    alertController.popoverPresentationController.sourceRect = CGRectMake(_actionSheetBtn.frame.origin.x, _actionSheetBtn.frame.origin.y, 20.0, 20.0);
//    alertController.popoverPresentationController.sourceView = _actionSheetBtn; //でも良い?
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)selectedActionWith:(int)index{
    NSLog(@"選択: %d",index);
    // 選択時の処理    
}
@end
