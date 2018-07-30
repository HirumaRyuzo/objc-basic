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
@property (weak, nonatomic) IBOutlet UITextField *toBtext;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)goPush:(id)sender {
    UIStoryboard *second = [UIStoryboard storyboardWithName:@"Second" bundle:[NSBundle mainBundle]];
    SecondViewController *secondView = [second instantiateInitialViewController];
    secondView.secondViewLabel = self.toBtext.text;
    // navigationControllerで遷移
    [self.navigationController pushViewController:secondView animated:YES];
}
@end
