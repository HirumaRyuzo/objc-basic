//
//  ViewController.m
//  stv_project2.1.8
//
//  Created by 比留間龍三 on 2018/07/03.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ( ) {
    NSArray   * _pickerData ;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 _pickerData   =   @ [ @"MickeyMouse" ,   @"MinnieMouse" ,   @"DonaldDuck" ,   @"DaisyDuck" ,   @"Goofy" ,   @"Pluto" ,   @"Duffy",   @"ShellieMay"] ;
    
    // Connect data
    self . picker . dataSource   =   self ;
    self . picker . delegate   =   self ;
}

// The number of columns of data
-   ( int ) numberOfComponentsInPickerView : ( UIPickerView   * ) pickerView
{
    return   1 ;
}

// The number of rows of data
-   ( int ) pickerView : ( UIPickerView   * ) pickerView  numberOfRowsInComponent : ( NSInteger ) component
{
    return   _pickerData . count ;
}

// The data to return for the row and component (column) that's being passed in
-   ( NSString * ) pickerView : ( UIPickerView   * ) pickerView  titleForRow : ( NSInteger ) row  forComponent : ( NSInteger ) component
{
    return   _pickerData [ row ] ;
}

@end
