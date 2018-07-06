//
//  ViewController.h
//  stv_project2.1.7
//
//  Created by 比留間龍三 on 2018/07/03.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController: UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;
@end
