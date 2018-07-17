//
//  ContentViewController.m
//  stv_project2.1.6
//
//  Created by 比留間龍三 on 2018/07/17.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // PageView.storyboard上のラベルに外部から渡された文字列を表示
    self.label.text = self.labelText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
