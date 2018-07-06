//
//  Account.m
//  stv_project1.1.5
//
//  Created by 比留間龍三 on 2018/07/05.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "Account.h"
#import "FavoriteProgrammingLanguage.h"

@interface Account () <FavoriteProgrammingLanguageDelegate>
@end

@implementation Account

//インスタンスに初期値を与える
-(id)initWithName:(NSString *)name age:(NSInteger)age gender:(NSString *)gender language:(NSString *)language {
    if (self = [super init]) { //Account.hのプロパティにアクセス
        self.name = name; //selfは「自分自身(=Account)のクラス」　引数（Viewコンでインスタンス化した太郎と花子の名前や性別など）の値をインスタンスの変数（空箱）に代入する
        self.age = age;
        self.gender = gender;
        self.language = language;
    }
    
    return self;
}

//デリゲートメソッドを定義する
- (void)joinInturn {    //メソッドの実装
    if ([self.gender isEqual: @"男性"]) {
        NSLog(@"%@君は、%@が得意な%ld歳です。", self.name, self.language, (long)self.age);
        NSLog(@"%@君はインターンに参加する。", self.name);
    } else { //もし男性じゃなかったら(=女性なら)"花子"を表示
        NSLog(@"%@さんは、%@が得意な%ld歳です。", self.name, self.language, (long)self.age);
        NSLog(@"%@さんはインターンに参加する。", self.name);
    }
    
    [self callDelegate];
}
- (void)canObjc {
    if([self.language isEqual: @"objective-c"]){
        NSLog(@"obj-cができる");
    }
}

- (void)callDelegate {
    //FavoriteProgrammingLanguageクラス初期化
    FavoriteProgrammingLanguage *favoriteProgrammingLanguage = [[FavoriteProgrammingLanguage alloc] init];
    //FavoriteProgrammingLanguageクラスのdelegateに自分自身を渡す
    favoriteProgrammingLanguage.delegate = self;
    //FavoriteProgrammingLanguageクラスのデリゲートメソッド呼び出し
    [favoriteProgrammingLanguage callCanObjc];
}

@end
