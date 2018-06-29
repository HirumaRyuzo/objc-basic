//
//  ViewController.m
//  stv_project1.1.4
//
//  Created by 比留間龍三 on 2018/06/25.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

//    【課題内容】
//    Accountクラスを作成し、インターンの参加者の一覧を
//    コンソールにログを出力する。
//
//    Accountクラスには、下記のプロパティとメソッドを定義する。
//
//    【プロパティ】
//    氏名：文字列型
//    年齢：整数型
//    性別：文字列型
//    得意な言語：文字列型
//
//    【メソッド】
//    男性の場合、「○○君は、○○が得意な○○歳です。」と表示する
//    女性の場合、「○○さんは、○○が得意な○○歳です。」と表示する。

#import "ViewController.h"
#import "Account.h" //Accountクラスのヘッダーをインポート　ヘッダーをインポートすれば実装ファイルに書い内容もインポートされる

@interface ViewController ()
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    //インスタンス化　　[クラス名 new] は [[クラス名 alloc]initWith] と同じ. init がイニシャライザ
Account *tarou = [[Account alloc]initWithName:@"太郎" age:30 gender:@"男性" language:@"objective-c"];
Account *hanako = [[Account alloc]initWithName:@"花子" age:25 gender:@"女性" language:@"swift"];

    //一人ずつ自動的に取得する
    NSArray *lists = @[tarou, hanako];
    for (Account *list in lists) {
    [list inturn]; //NSLog(@"%@", list);だと「Account.h」で実装したメッソドの文章で出ない。
    } //[ ]
}

@end
