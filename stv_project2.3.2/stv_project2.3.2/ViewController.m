//
//  ViewController.m
//  stv_project2.3.2
//
//  Created by 比留間龍三 on 2018/07/17.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "FMDB.h"
#import "ViewController.h"

// 接続
@interface ViewController () {
    // FMDBオブジェクト
    FMDatabase *_db;
}

@property (weak, nonatomic) IBOutlet UITextView *teString;

@end

// 実装
@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //    if(![db open]) {
    //        return;    // dbのオープンに失敗した
    //    }
    //    [db setShouldCacheStatements:YES];
    //    [db setCrashOnErrors:YES];
    //
    //    if(![db columnExists:@"tr_todo" columnName:@"（カラム名）"]) {
    //        NSString* sql = [NSString stringWithFormat:@"ALTER TABLE （テーブル名） ADD COLUMN （カラム名） INTEGER DEFAULT 0"];
    //        [db executeUpdate:sql];
    
    //NSSearchPathForDirectoriesInDomains:メソッドを使用し、シミュレータであれば以下のようなDocumentsフォルダのパスを取得します。
    //Users/username/Library/Application Support/iPhone Simulator/5.1/Applications/xxxxxx/Documents/
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir = [paths objectAtIndex:0];
    
    //stringByAppendingPathComponent:メソッドで取得したパスの末尾にデータベースのファイル名を追加します。
    //databaseWithPath:メソッドにデータベースファイルのパスを指定し、
    //ファイルが既にある場合は参照、なければ新規にデータベースファイルを作成し、FMDatabaseインスタンスを返します。
    FMDatabase *db = [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"test.db"]];

//    NSString *sql = @"CREATE TABLE IF NOT EXISTS tr_todo (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);";
    NSString *sql = @"CREATE TABLE IF NOT EXISTS tr_todo (todo_id INTEGER PRIMARY KEY,todo_title TEXT,todo_contents TEXT,created date,modified date,limit_date date,delete_flg TEXT);";
    
    //ディレクトリの場所を表示する
    NSLog(@"%@", NSHomeDirectory());
    //検索できたらそのコードをスポットライトで検索して
    
    // DBオープン
    [db open];
    [db executeUpdate:sql];
    // DBクローズ
    [db close];


}


//// [Open]押した時
//- (IBAction)proc01:(id)sender {
//    // ファイルパスの取得
//    NSString *pth01 = (NSString *)
//    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, // ドキュメントディレクトリー
//                                         NSUserDomainMask, // User
//                                         YES) lastObject];
//    NSString *pth02 = [pth01 stringByAppendingPathComponent:@"test01.db"];
//    NSLog(@"%@", pth02); // ドキュメントフォルダー先
//
//    // FMDBオブジェクト生成
//    _db = [FMDatabase databaseWithPath:pth02];
//
//    // DBオープン
//    [_db open];
//
//    BOOL ret = [_db open];
//    NSLog(@"DBオープン：%@", ret ? @"YES" :@"NO");
//
//    self.teString.text = [self.teString.text
//                          stringByAppendingFormat:@"DBオープン：%@\n", ret ? @"YES" :@"NO"];
//}
//
//// [Close]押した時
//- (IBAction)proc02:(id)sender {
//    // DBクローズ
//    [_db class];
//    self.teString.text = [self.teString.text
//                          stringByAppendingFormat:@"DBクローズ\n"];
//}
//
//// [Create Table]押した時
//- (IBAction)proc03:(id)sender {
//    // AUTOINCREMENT 自動でナンバーリング
//
//    // テーブル(m_person)の作成 IF NOT EXISTS:DBが存在していなかったら
//    //    NSString *sql =
//    //        @"CREATE TABLE IF NOT EXISTS m_person ("
//    //            @"id INTEGER PRIMARY KEY AUTOINCREMENT, "
//    //            @"name TEXT NOT NULL,"
//    //            @"age INTEGER,"
//    //            @"family_id INTEGER);";
//
//    NSString *sql =
//    @"CREATE TABLE IF NOT EXISTS m_person ("
//    @"id INTEGER PRIMARY KEY AUTOINCREMENT, "
//    @"name TEXT NOT NULL,"
//    @"age INTEGER);";
//
//    //[_db executeUpdate:sql]; // execute 実行
//    BOOL ret = [_db executeUpdate:sql]; // execute 実行
//    NSLog(@"DBオープンCreate：%@", ret ? @"YES" :@"NO");
//    self.teString.text = [self.teString.text
//                          stringByAppendingFormat:@"DBオープンCreate：%@\n", ret ? @"YES" :@"NO"];
//}
//
//// [Drop Table]テーブル削除
//- (IBAction)proc08:(id)sender {
//    NSString *sql = @"DROP TABLE m_person ;";
//
//    //[_db executeUpdate:sql]; // execute 実行
//    BOOL ret = [_db executeUpdate:sql]; // execute 実行
//    NSLog(@"テーブル削除：%@", ret ? @"YES" :@"NO");
//    self.teString.text = [self.teString.text
//                          stringByAppendingFormat:@"テーブル削除：%@\n", ret ? @"YES" :@"NO"];
//    
//}
//
//// [INSERT]押した時
//- (IBAction)proc04:(id)sender {
//    // テーブル挿入
//    NSString *sql =
//    @"INSERT INTO m_person(name, age) "
//    @"VALUES(?, ?);";
//    //[_db executeUpdate:sql, @"サザエ", @24];
//
//    BOOL ret = [_db executeUpdate:sql,@"しずちゃん", @10]; // execute 実行
//    NSLog(@"テーブル挿入：%@", ret ? @"YES" :@"NO");
//    self.teString.text = [self.teString.text
//                          stringByAppendingFormat:@"テーブル挿入：%@\n", ret ? @"YES" :@"NO"];
//}
//
//// [SELECT]押した時
//- (IBAction)proc05:(id)sender {
//    // テーブル検索
//    NSString *sql = @"SELECT id, name, age FROM m_person;";
//    FMResultSet *res = [_db executeQuery:sql]; // execute 実行
//
//    while ([res next] == YES) {
//        int col01 = [res intForColumnIndex:0];
//        NSString *col02 = [res stringForColumnIndex:1];
//        int col03 = [res intForColumnIndex:2];
//
//        NSLog(@"DB %d, %@, %d", col01, col02, col03);
//        self.teString.text = [self.teString.text
//                              stringByAppendingFormat:@"DB %d, %@, %d\n", col01, col02, col03];
//    }
//}
//
//// [UPDATE]押した時
//- (IBAction)proc06:(id)sender {
//    // テーブル更新
//    NSString *sql =
//    @"UPDATE m_person SET name = ? where id = ?;";
//
//    //[_db executeUpdate:sql, @"サザエ", @24];
//    BOOL ret = [_db executeUpdate:sql,@"ジャイ子", @3]; // execute 実行
//    NSLog(@"テーブル更新：%@", ret ? @"YES" :@"NO");
//    self.teString.text = [self.teString.text
//                          stringByAppendingFormat:@"テーブル更新：%@\n", ret ? @"YES" :@"NO"];
//}
//
//// [DELETE]押した時
//- (IBAction)proc07:(id)sender {
//
//    // テーブル削除
//    NSString *sql =
//    @"delete from m_person where id = ?;";
//    BOOL ret = [_db executeUpdate:sql, @3]; // execute 実行
//    NSLog(@"テーブル削除：%@", ret ? @"YES" :@"NO");
//    self.teString.text = [self.teString.text
//                          stringByAppendingFormat:@"テーブル削除：%@\n", ret ? @"YES" :@"NO"];
//}
//
//// Text記述クリーン
//- (IBAction)trashAction:(id)sender {
//    self.teString.text = nil;
//}

@end
