//
//  ViewController.m
//  1.1.5DelegateSample
//
//  Created by 比留間龍三 on 2018/07/06.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"
#import "Hoge.h"

@interface ViewController () <HogeDelegate> // HogeDelegateに準拠します

@property (weak, nonatomic) IBOutlet UILabel *hogeLabel;
@property (strong, nonatomic) Hoge *hoge;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void) viewDidLoad{
    [super viewDidLoad];
    self.hoge = [Hoge new];
    // hogeのdelegateに自身を指定します。
    self.hoge.delegate = self;
    [self.hoge fuga];
}

#pragma mark - HogeDelegateMethod

/**
 delegationの通知を受けとったら実行する処理
 delegateメソッドの具体的な実装を記述します。
 @param string Hogeクラス側から渡されてくる文字列
 */
- (void)didFuga:(NSString *)string{
    // Hogeクラス側から渡されてくる文字列をラベルに表示します。
    self.hogeLabel.text = string;
}

@end
