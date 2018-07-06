//
//  FavoriteProgrammingLanguage.h
//  stv_project1.1.5
//
//  Created by 比留間龍三 on 2018/06/29.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <Foundation/Foundation.h>
//protocol宣言
@protocol FavoriteProgrammingLanguageDelegate <NSObject>
//デリゲート経由で呼ばれるメソッドを宣言
//オプショナルは実装しなくてもよい
@optional
- (void)canObjc;
@end

@interface FavoriteProgrammingLanguage: NSObject
//デリゲートのプロパティ宣言（デリゲートオブジェクト）
@property (nonatomic, assign) id<FavoriteProgrammingLanguageDelegate> delegate;
//ViewControllerから呼ばれるサンプルメソッド
- (void)callCanObjc;

@end

