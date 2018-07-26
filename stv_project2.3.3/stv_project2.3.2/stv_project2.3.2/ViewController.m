//
//  ViewController.m
//  stv_project2.3.2
//
//  Created by 比留間龍三 on 2018/07/26.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // FMDB常套句
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * filePath = [[path firstObject] stringByAppendingString:@"sample.db"];
    // DB接続用のインスタンス生成
    FMDatabase *fmdb = [[FMDatabase alloc] initWithPath:filePath];

    //データベース開ける
    [fmdb open];
    
    //データベース作成
    [fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS tr_todo(todo_id integer PRYMARY KEY,todo_title text,todo_contents text,created integer,modified integer,limit_date integer,delete_flg integer);"];
    FMResultSet *result = [fmdb executeQuery:@"SELECT * FROM sqlite_master"];
    while ([result next]){
        //tr_todo という名前でテーブル作成
        NSString *tableName = [result stringForColumn:@"name"];
        NSLog(@"テーブル名 %@", tableName);
        NSLog(@"%@", NSHomeDirectory());
    }
}

@end
