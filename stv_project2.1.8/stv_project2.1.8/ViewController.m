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

    self . picker . dataSource   =   self ;
    self . picker . delegate   =   self ;
}

// データの列数
-   ( int ) numberOfComponentsInPickerView : ( UIPickerView *) pickerView{
    return   1 ;
}

// データの行数
-   ( int ) pickerView : ( UIPickerView   * ) pickerView  numberOfRowsInComponent : ( NSInteger ) component{
    return   _pickerData . count ;
}

// 渡された行とコンポーネント（列）に対して返されるデータ
-   ( NSString * ) pickerView : ( UIPickerView   * ) pickerView  titleForRow : ( NSInteger ) row  forComponent : ( NSInteger ) component{
    return   _pickerData [ row ] ;


}

@end
