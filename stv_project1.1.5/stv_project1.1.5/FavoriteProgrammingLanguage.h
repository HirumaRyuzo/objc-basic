//
//  FavoriteProgrammingLanguage.h
//  stv_project1.1.5
//
//  Created by 比留間龍三 on 2018/06/29.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <Foundation/Foundation.h>

//protocol宣言
@protocol SampleDelegate<NSObject>
//デリゲート経由で呼ばれるメソッドを宣言
@optional
- (void)sample;
@end

@interface FavoriteProgrammingLanguage : NSObject
//デリゲートのプロパティ宣言
@property (nonatomic, assign) id<SampleDelegate> delegate;

//ViewControllerから呼ばれるサンプルメソッド
- (void)callDelegate;

@end

