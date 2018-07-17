//
//  ViewController.m
//  stv_project2.3.1
//
//  Created by 比留間龍三 on 2018/07/17.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSArray *arr = @[@"Disney",@"Mickey Mouse",@"ミッキーマウス"];
//    NSLog(@"%@",arr[0]);//Disney
//    NSLog(@"%@",arr[1]);//Mickey Mouse
//    NSLog(@"%@",arr[2]);//ミッキーマウス
//
//    NSDictionary *metro = @{@"G": @"銀座線",
//                            @"M": @"丸ノ内線",
//                            @"H":@"日比谷線",
//                            @"T": @"東西線",
//                            @"C": @"千代田線",
//                            @"Y": @"有楽町線",
//                            @"Z": @"半蔵門線",
//                            @"N": @"南北線",
//                            @"F": @"副都心線",};
//
//    NSString *mt = metro[@"N"];
//    NSLog(@"%@", mt);
    
//    //データを作る
//    NSArray *array = @[@"http://www.apple.com", @"http://www.9revolution9.com", @"https://twitter.com/"];
//    //NSUserDefaultsのインスタンスを作る
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:array forKey:@"bookmarks"];
//    BOOL successful = [defaults synchronize];
//    if (successful) {
//        NSLog(@"%@", @"データの保存に成功しました。");
//    }
//    //データを作る
//    NSDictionary *dict = @{
//                           @"home" : @"http://www.google.co.jp",
//                           @"font-size" : @14,
//                           @"javascript-enabled" : @(YES)
//                           };
//    //データ書き込み
//    [defaults registerDefaults:dict];
//    //読み込み
//    NSLog(@"%@", [defaults objectForKey:@"home"]);
//    NSLog(@"%d", [defaults boolForKey:@"javascript-enabled"]);
//    NSLog(@"%ld", (long)[defaults integerForKey:@"font-size"]);
    
//    //int型
//    NSInteger num1 = 5;
//    NSLog(@"%.1ld",(long)num1);
//    //double型
//    double num2 = 3.14f;
//    NSLog(@"%.2f",num2);
//    //string型
//    NSString *str = @"あいうえお";
//    NSLog(@"%@",str);

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults setObject:@"1118" forKey:@"KEY_A"];  // をKEY_Iというキーの初期値は99
    [defaults setObject:@"3.14" forKey:@"KEY_B"];  // をKEY_Dというキーの初期値は88.88
    [defaults setObject:@"hoge" forKey:@"KEY_C"];  // をKEY_Sというキーの初期値はhoge
    [ud registerDefaults:defaults];
    
    [ud setInteger:100 forKey:@"KEY_A"];  // int型の100をKEY_Iというキーで保存
    [ud setDouble:1.23 forKey:@"KEY_B"];  // double型の1.23をKEY_Dというキーで保存
    [ud setObject:@"あいう" forKey:@"KEY_C"];  // "あいう"をKEY_Sというキーで保存
    [ud synchronize];  // NSUserDefaultsに即時反映させる（即時で無くてもよい場合は不要）
    
    // NSUserDefaultsからデータを読み込む
    int i = [ud integerForKey:@"KEY_A"];  // KEY_Iの内容をint型として取得
     NSLog(@"%.1ld",(long)i);
    double d = [ud doubleForKey:@"KEY_B"];  // KEY_Dの内容をdouble型として取得
    NSLog(@"%.2f",d);
    NSString *s = [ud stringForKey:@"KEY_C"];  // KEY_Sの内容をNSString型として取得
    NSLog(@"%@",s);
}

@end
