//
//  FavoriteProgrammingLanguage.m
//  stv_project1.1.5
//
//  Created by 比留間龍三 on 2018/06/29.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "FavoriteProgrammingLanguage.h"

@implementation FavoriteProgrammingLanguage
//ViewControllerから呼ばれるメソッド
- (void)callCanObjc {//delegategメソッドが＠optionalの場合、実装されていない可能がある。なので”respondsToSelector”で実装有無を判定
    if ([self.delegate respondsToSelector:@selector(canObjc)]) {
        [self.delegate canObjc];
    }
}

@end
