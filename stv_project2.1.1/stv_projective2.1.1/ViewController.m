//
//  ViewController.m
//  stv_projective2.1.1
//
//  Created by 比留間　龍三 on 2018/06/10.
//  Copyright © 2018年 h. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *localizedLabel;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    NSString* localizedText = NSLocalizedString(@"I started the Obj-C course.", nil);
    self.localizedLabel.text = localizedText;
}
@end
