//
//  Hoge.m
//  1.1.5DelegateSample
//
//  Created by 比留間龍三 on 2018/07/06.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "Hoge.h"

@interface Hoge ()

@property (strong, nonatomic) NSString *hogeString;
@end

@implementation Hoge

/*
 その他の実装は省略
 hogeStringに値が設定されていたりします。
 */

- (void)fuga{
    /*
     delegateメソッドが@optionalなので、respondsToSelectorで
     delegateオブジェクトがdelegateメソッドを実装しているか判定します。
     */
    if ([self.delegate respondsToSelector:@selector(didFuga:)]) {
        /*
         delegationの通知を送ります。
         必要であれば、このように引数にHogeクラス側の情報を渡すことも可能です。
         */
        self.hogeString = @"aaa";
        [self.delegate didFuga:self.hogeString];
    }
}

@end
