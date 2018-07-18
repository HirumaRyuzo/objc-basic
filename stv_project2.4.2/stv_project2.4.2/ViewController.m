//
//  ViewController.m
//  stv_project2.4.2
//
//  Created by 比留間龍三 on 2018/07/18.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"


@interface ViewController ()
@end
//ATS対策をする際にはNSAllowsArbitraryLoadsのみで良い！！
NSString *const weather = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self connectAPI];
}

- (void)connectAPI {
    //Block構文内で自動変数に対して代入した際のエラー防止指定子
    __block NSArray *forecasts;
    //エラー時のレスポンスオブジェクトの取得
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:(NSString *)weather parameters:nil progress:nil
         //タスク作成
         success:^(NSURLSessionTask *task, id responseObject) {
             @try { // json取得に成功した場合の処理
                 if ((forecasts = responseObject[@"forecasts"])) {
                     for (NSDictionary *forecast in forecasts) {
                         NSLog(@"%@", forecast[@"date"]);
                         NSLog(@"%@", forecast[@"telop"]);
                         NSLog(@"%@", forecast[@"image"][@"url"]);
                     }
                 } // エラーの場合の処理
             } @catch (NSException *exception) {
                 NSLog(@"[ERROR)\n exception[%@]", exception);
             }
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"APIを取得できませんでした。");
         }];
}

@end
