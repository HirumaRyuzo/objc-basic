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

@synthesize toolBarView;

- (void)viewDidLoad {
    [super viewDidLoad];
    _pickerData   =   @ [ @"MickeyMouse" ,   @"MinnieMouse" ,   @"DonaldDuck" ,   @"DaisyDuck" ,   @"Goofy" ,   @"Pluto" ,   @"Duffy",   @"ShellieMay"] ;

    self. picker. dataSource = self;
    self. picker. delegate = self;
    [self toolbarBcode];
    [self setTapGesture];
    
    _character.text = @"Disney Character";
}


-(void)toolbarBcode{
    toolbarView = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, 416.0, 320.0, 44.0)];
    toolbarView.barStyle = UIBarStyleBlack;
    UIBarButtonItem *aaa = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPageCurl target:self action:@selector(toolbarAction:)];
    aaa.style = UIBarButtonItemStyleBordered;
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolbarView setItems:aaa animated:YES];
    [self.view addSubview:toolbarView];
}

-(void)toolbarAction:(id)sender{
    NSLog(@"ツールバーです。");
}

- (void)setTapGesture{
    // シングルタップ
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(character:)];
    // デリゲートをセット
    tapGesture.delegate = self;
    // view に追加
    [self.view addGestureRecognizer:tapGesture];
}

// データの列数
- (int) numberOfComponentsInPickerView: (UIPickerView *) pickerView {
    return   1 ;
}

// データの行数
- (int) pickerView : (UIPickerView *) pickerView numberOfRowsInComponent: (NSInteger) component {
    return _pickerData . count ;
}

// 渡された行とコンポーネント（列）に対して返されるデータ
- (NSString *) pickerView: (UIPickerView *) pickerView titleForRow: (NSInteger) row forComponent: (NSInteger) component {
    return   _pickerData [ row ] ;
}

//-- ピッカーで選択されたときに行う処理
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"選択=%@", _pickerData [row]);
    //ラベルに表示
    _character.text = _pickerData[row];
}

//-- LabelタップでPickerを非表示
- (void)character:(UITapGestureRecognizer *)sender{
    _picker.hidden = NO;
}

//初回起動判定
- (BOOL)isFirstRun{
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
        NSLog(@"初回起動");
    }
    return YES;
}

- (IBAction)done:(id)sender {
}
@end
