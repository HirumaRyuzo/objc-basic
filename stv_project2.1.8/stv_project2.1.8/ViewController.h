//
//  ViewController.h
//  stv_project2.1.8
//
//  Created by 比留間龍三 on 2018/07/03.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  ViewController  : UIViewController < UIPickerViewDataSource ,   UIPickerViewDelegate >
@property   ( weak ,   nonatomic )   IBOutlet   UIPickerView   *picker ;
@end 
