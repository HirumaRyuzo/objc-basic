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
    
    _character.text = @"Disney Character";
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

//初回起動判定
- (BOOL)isFirstRun
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaults objectForKey:@"firstRunDate"]) {
        // 日時が設定済みなら初回起動でない
        return NO;
    }
    
    // 初回起動日時を設定
    [userDefaults setObject:[NSDate date] forKey:@"firstRunDate"];
    
    // 保存
    [userDefaults synchronize];
    
    // 初回起動
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if ([self isFirstRun]) {
        // 初回起動時の処理を書く
        NSLog(@"初回起動だよ");
    }
    
    return YES;
}

@end
