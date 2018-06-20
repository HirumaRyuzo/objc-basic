//
//  main.m
//  stv_project1.1.3
//
//  Created by 比留間　龍三 on 2018/06/07.
//  Copyright © 2018年 h. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
        
//      if文、if〜else文、if〜else if文、三項演算子、for文、高速列挙構文、switch
//      を利用したプログラムを作成し、結果をコンソールに出力する。
        
        //if文
        NSInteger n = 5;
        if (n >= 0) {
            NSLog(@"Nが0以上の場合表示"); //5は0以上なので
        }
        
        //if〜else文
        if (n >= 0 && n <= 4) {
            NSLog(@"はれ");//0以上-4以下
        }else{
            NSLog(@"あめ");//5以上
        }
        
        //if〜else if文
        if(n < 0){
            NSLog(@"ドラえもん"); //0以下
        }else if(n > 2){
            NSLog(@"ミッキーマウス"); //2以上　これが実行される
        }else{
            NSLog(@"スヌーピー"); //1−2
        }
        
        //三項演算子
        NSInteger b = 5;
        NSString *str = (n == b) ? @"おなじ" : @"ちがう";
        NSLog(@"%@", str); //上記のnとBの値は同じ５なので”おなじ”
        
        //for文：iを0から9まで10ループさせる
        for(int i=0; i<10; i++){
            NSLog(@"%d回目のループ",i+1);
        }
        
        //高速列挙構文
        NSArray *array = @[@"a", @"b", @"c", @"d", @"e"];
        for (NSString *str in array) {
            NSLog(@"%@", str);
        }
        
        //switch
        int k;
        k = arc4random() % 6; //0から6の乱数を挿入してるので毎回変わる
        
        NSLog(@"kは%dです",k);
        
        switch (k) {
            case 3:
                NSLog(@"kは3です");
                break;
                
            case 5:
                NSLog(@"kは5です");
                break;
                
            default:
                NSLog(@"kは3でも5でもありません");
                break;
        }
        
    }
    return 0;
}
