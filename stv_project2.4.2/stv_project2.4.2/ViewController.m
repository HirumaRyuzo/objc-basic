//
//  ViewController.m
//  stv_project2.4.2
//
//  Created by 比留間龍三 on 2018/07/18.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Wether.h"

@interface ViewController ()
@property NSMutableArray *wether;
@property NSString *cellDateLabel;
@property NSString *cellTelop;
@property NSString *cellText;
@property NSString *cellImg;
@end
//ATS対策をする際にはNSAllowsArbitraryLoadsのみで良い！！他のもいれると競合してしまう可能性あり
NSString *const getWeather = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self connectAPI];
}

- (void)connectAPI {
    //Block構文内で自動変数に対して代入した際のエラー防止指定子
    __block NSArray *forecasts;
    self.wether = [NSMutableArray new];
    //エラー時のレスポンスオブジェクトの取得
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:(NSString *)getWeather parameters:nil progress:nil
         //タスク作成
         success:^(NSURLSessionTask *task, id responseObject) {
             @try {//@try常に実行される　→ json取得に成功した場合の処理
                 if ((forecasts = responseObject[@"forecasts"])) {
                     for (NSDictionary *forecast in forecasts) {
//                         NSLog(@"%@", forecast[@"date"]);
//                         NSLog(@"%@", forecast[@"telop"]);
//                         NSLog(@"%@", forecast[@"image"][@"url"]);
                         
                         Wether *wetherClass = [Wether new];
                         wetherClass.cellDateLabel = forecast[@"dateLabel"];
                         wetherClass.cellTelop     = forecast[@"telop"];
                         wetherClass.cellImg       = forecast[@"image"][@"url"];
                         
                         [self.wether addObject:wetherClass];
                         NSLog(@"tennki %@", self.wether[0]);
                     }
                 }//@catch例外が起きると実行される　→ エラーの場合の処理
             } @catch (NSException *exception) {
                 NSLog(@"[ERROR)\n exception[%@]", exception);
             }
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"APIを取得できませんでした。");
         }];
}

- (IBAction)actionSheetBtnEnter:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"選択" message:@"いつの天気が知りたいですか？" preferredStyle:UIAlertControllerStyleActionSheet];
    // 上から順にボタンが配置
    [alertController addAction:[UIAlertAction actionWithTitle:@"今日" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self selectedActionWith:1];
        Wether *wetherClass = [Wether new];
        wetherClass = self.wether[0];
        NSLog(@"%@", wetherClass.cellTelop);
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"明日" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self selectedActionWith:2];
        Wether *wetherClass = [Wether new];
        wetherClass = self.wether[1];
        NSLog(@"%@", wetherClass.cellTelop);
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"明後日" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self selectedActionWith:3];
            @try {
            Wether *wetherClass = [Wether new];
            wetherClass = self.wether[2];
            NSLog(@"%@", wetherClass.cellTelop);
            //例外が発生するところ
        } @catch (NSException *e) {
            //例外が発生した時の処理
            NSLog(@"取得できません");
        }
        
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"やっぱいーや" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self selectedActionWith:0];
        
    }]];

    [self presentViewController:alertController animated:YES completion:nil];
}

//この文章なしでアクションシートボタンの中に直接NSLogでも良い
-(void)selectedActionWith:(int)index{
    NSLog(@"選択: %d",index);
    // 選択時の処理
    switch (index) {
        case 1:
            //"今日"のボタンが押されたときの処理
            NSLog(@"今日が選択されました");
            break;
        case 2:
            //"明日"のボタンが押されたときの処理
            NSLog(@"明日が選択されました");
            break;
        case 3:
            //"明後日"のボタンが押されたときの処理
            NSLog(@"明後日が選択されました");
            break;
        case 0:
            //"キャンセル"のボタンが押されたときの処理
            NSLog(@"キャンセルが選択されました");

            break;
    }
}

@end
