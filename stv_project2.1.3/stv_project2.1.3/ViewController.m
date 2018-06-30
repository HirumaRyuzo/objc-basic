//
//  ViewController.m
//  stv_project2.1.3
//
//  Created by 比留間　龍三 on 2018/06/15.
//  Copyright © 2018年 h. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSArray<UIImage *> *view2;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view2 = @[@"Image_0", @"Image_1", @"Image_2", @"Image_3"];
    NSLog(@"%@", self.view2);
}
//ヘッダにIBActionで接続するとこっちにも自動にあらわれるので、
//直接こっちにつなげてもよいけど他のクラスでアクセスはできなくなるのでヘッダーに接続したほうが確実
- (IBAction)tap:(id)sender {//ボタンがタップされた時の処理
    int rNum = arc4random_uniform(4);
    NSLog(@"%@", self.view2);
    NSLog(@"%ld", (long)rNum);
    NSLog(@"%@", self.view2[rNum]);
    self.imageView.image = [UIImage imageNamed:self.view2[rNum]];
}
@end
