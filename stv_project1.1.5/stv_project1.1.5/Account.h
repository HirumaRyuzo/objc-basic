//
//  Account.h
//  stv_project1.1.5
//
//  Created by 比留間龍三 on 2018/07/05.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Account: NSObject

//外部に公開する属性のプロパティを宣言
@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic) NSString *gender;
@property (nonatomic) NSString *language;

//メソッドを宣言（メソッド宣言の場所は@propaertyの下）
- (id)initWithName: (NSString *)name age:(NSInteger)age gender:(NSString *)gender language:(NSString *)language;
- (void)joinInturn;

@end
