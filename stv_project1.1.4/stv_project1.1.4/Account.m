//
//  Account.m
//  stv_project1.1.4
//
//  Created by 比留間龍三 on 2018/06/25.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "Account.h"

@implementation Account

//インスタンスに初期値を与える
-(id)initWithName:(NSString *)name age:(NSInteger)age gender:(NSString *)gender language:(NSString *)language{
    if(self = [super init])
    { //Account.hのプロパティにアクセス
    self.name = name; //selfは「自分自身(=Account)のクラス」
    self.age = age;
    self.gender = gender;
    self.language = language;
    }
    return self;
}

//メソッドを定義する
- (void)inturn
{    //メソッドの実装
    if([self.gender  isEqual: @"男性"]){
        NSLog(@"%@君は、%@が得意な%d歳です。",self.name,self.language,self.age);
    }else{ //もし男性じゃなかったら(=女性なら)"花子"を表示
        NSLog(@"%@さんは、%@が得意な%d歳です。",self.name,self.language,self.age);
    }
}
@end
