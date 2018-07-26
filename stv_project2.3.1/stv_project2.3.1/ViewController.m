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

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
    [ud setInteger:111 forKey:@"KEY_A"];  // int型の100をKEY_Iというキーで保存
    [ud setDouble:1.13498749827 forKey:@"KEY_B"];  // double型の1.23をKEY_Dというキーで保存
    [ud setObject:@"ああ" forKey:@"KEY_C"];  // "あいう"をKEY_Sというキーで保存
    [ud synchronize];  // NSUserDefaultsに即時反映させる（即時で無くてもよい場合は不要）
    
    // NSUserDefaultsからデータを読み込む
    NSInteger keyI = [ud integerForKey:@"KEY_A"];  // KEY_Iの内容をint型として取得
    NSLog(@"%ld",(long)keyI);
    double keyD = [ud doubleForKey:@"KEY_B"];  // KEY_Dの内容をdouble型として取得
    NSLog(@"%.2f",keyD);
    NSString *keyS = [ud stringForKey:@"KEY_C"];  // KEY_Sの内容をNSString型として取得
    NSLog(@"%@",keyS);
}

@end
