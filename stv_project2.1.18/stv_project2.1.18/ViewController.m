//
//  ViewController.m
//  stv_project2.1.18
//
//  Created by 比留間龍三 on 2018/07/15.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)goPush:(id)sender {
    UIStoryboard *second = [UIStoryboard storyboardWithName:@"Second" bundle:[NSBundle mainBundle]];
    UIViewController *secondView = [second instantiateInitialViewController];
    // navigationControllerで遷移
    [self.navigationController pushViewController:secondView animated:YES];
}
@end
