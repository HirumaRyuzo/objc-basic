//
//  ViewController.m
//  stv_project2.6.1
//
//  Created by 比留間龍三 on 2018/07/23.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
//- (IBAction)getValue:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *getValueBtn;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *englishLabel;
@property (weak, nonatomic) IBOutlet UILabel *japaneseLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)getValue:(id)sender {
    NSLog(@"ボタン押されたよ");
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //これがないとスキームで呼び出した時に表示されない
    self.numberLabel.hidden = NO;
    self.englishLabel.hidden = NO;
    self.japaneseLabel.hidden = NO;
    self.numberLabel.text = appDelegate.result[@"number"];
    self.englishLabel.text = appDelegate.result[@"english"];
    self.japaneseLabel.text = appDelegate.result[@"japanese"];
}
@end
