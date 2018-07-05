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

//#import "ViewController.h"
//
//@interface ViewController ()
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//}
//
//@end
//
#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self main];
}

- (void)main{
    //MyClass初期化
    Account *aaa = [[Account alloc] init];
    //MyClassの delegateに自分自身を渡す
    aaa.delegate = self;
    //MyClassのデリゲートメソッド呼び出し
    [aaa callDelegate];
}

//デリゲートメソッド
- (void)sample{
    NSLog(@"obj-cができる");
}

@end
