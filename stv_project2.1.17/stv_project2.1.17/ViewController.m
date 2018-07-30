//
//  ViewController.m
//  stv_project2.1.17
//
//  Created by 比留間龍三 on 2018/07/15.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)goBscreen:(id)sender {
    UIStoryboard *storyboardB = [UIStoryboard storyboardWithName:@"StoryboardB" bundle:nil];
    // 画面遷移
    UIViewController *initialViewController = [storyboardB instantiateViewControllerWithIdentifier:@"ViewController2"];
    
    [self presentViewController:initialViewController animated:YES completion:nil];
}
@end
