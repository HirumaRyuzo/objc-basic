//
//  main.m
//  stv_project2.3.2
//
//  Created by 比留間龍三 on 2018/07/17.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


//FMDBのAPIを利用して、Databaseの作成及び、テーブルを作成する。
//テーブル作成後、下記のツールを利用して、実データを確認する。
//（http://sqlitebrowser.org/）
//
//■テーブル名:  tr_todo
//
//■カラム名]
//todo_id               タスクID
//todo_title           タイトル
//todo_contents    内容
//created               登録日
//modified　　      変更日
//limit_date　　   期限日
//delete_flg　　    削除フラグ
