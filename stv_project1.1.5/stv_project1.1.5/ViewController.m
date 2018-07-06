//
//  ViewController.m
//  stv_project1.1.5
//
//  Created by 比留間龍三 on 2018/06/29.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

//課題内容
//①FavoriteProgrammingLanguageクラスを定義する。
//【メソッド】
//・インターンに参加する
//
//②FavoriteProgrammingLanguageDelegateプロトコルを定義する。
//【オプショナルメソッド】
//・Obj-Cができる
//
//③AccountクラスからFavoriteProgrammingLanguageクラスの
//インターンに参加メソッドを呼ぶと、
//FavoriteProgrammingLanguageから「Obj-Cができる」通知を受信する。

#import "ViewController.h"
#import "Account.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //インスタンス化　　[クラス名 new] は [[クラス名 alloc]initWith] と同じ. init がイニシャライザ
    Account *taro = [[Account alloc] initWithName:@"太郎" age:30 gender:@"男性" language:@"objective-c"];
    Account *hanako = [[Account alloc] initWithName:@"花子" age:25 gender:@"女性" language:@"swift"];
    //一人ずつ自動的に取得する
    NSArray *lists = @[taro, hanako];
    for (Account *list in lists) {
        [list joinInturn]; //NSLog(@"%@", list);だと「Account.h」で実装したメソッドの文章で出ない。
    }
}

@end
