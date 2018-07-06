//
//  Hoge.h
//  1.1.5DelegateSample
//
//  Created by 比留間龍三 on 2018/07/06.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 HogeDelegate protocol
 */
@protocol HogeDelegate <NSObject>
/*
 @optionalではないメソッドは、delegate準拠先で必ず実装する必要があります。
 実装しないと警告が発生します。
 */
@optional
// @optional以下のメソッドはdelegate準拠先での実装は必須ではなくなります。
- (void)didFuga: (NSString *)string;

@end

@interface Hoge : NSObject

/**
 delegateオブジェクト
 */
@property (weak, nonatomic) id <HogeDelegate> delegate;

- (void)fuga;

@end
