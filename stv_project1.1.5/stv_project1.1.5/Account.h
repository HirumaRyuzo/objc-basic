//
//  Account.h
//  stv_project1.1.5
//
//  Created by 比留間龍三 on 2018/07/05.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <Foundation/Foundation.h>
////プロトコル宣言
//@protocol delegate
////@optionalの後は実装してもしなくてもよい（オプショナルメソッド）「obj-cができる」
//@optional
//- (void)objc;
//@end
//
////デリゲートインスタンスの定義＝プロトコルの実装？！？！
//@interface Account : NSObject <delegate>
//@property(weak, nonatomic) id <delegate> delegate;
//- (void)aaa;
//@end

//protocolを宣言しておく
@protocol SampleDelegate;

@interface Account : NSObject {
    //デリゲートを登録
    id<SampleDelegate> _delegate;
}

@end

#pragma mark delegate prottype
