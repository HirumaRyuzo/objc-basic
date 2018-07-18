//
//  ViewController.m
//  stv_project2.3.2
//
//  Created by 比留間龍三 on 2018/07/17.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "FMDB.h"
#import "ViewController.h"
#import "InputViwController.h"

// 接続
@interface ViewController () {
    // FMDBオブジェクト
    FMDatabase *_db;
    NSMutableArray *uid;
    NSMutableArray *limit;
}

//@property (weak, nonatomic) IBOutlet UITextView *teString;

@end

// 実装
@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //NSSearchPathForDirectoriesInDomains:メソッドを使用し、シミュレータであれば以下のようなDocumentsフォルダのパスを取得します。
    //Users/username/Library/Application Support/iPhone Simulator/5.1/Applications/xxxxxx/Documents/
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir = [paths objectAtIndex:0];
    
    //stringByAppendingPathComponent:メソッドで取得したパスの末尾にデータベースのファイル名を追加します。
    //databaseWithPath:メソッドにデータベースファイルのパスを指定し、
    //ファイルが既にある場合は参照、なければ新規にデータベースファイルを作成し、FMDatabaseインスタンスを返します。
    FMDatabase *db = [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"test.db"]];

    //例文  NSString *sql = @"CREATE TABLE IF NOT EXISTS tr_todo (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);";
    NSString *sql = @"CREATE TABLE IF NOT EXISTS tr_todo (todo_id INTEGER PRIMARY KEY,todo_title TEXT,todo_contents TEXT,created date,modified date,limit_date TEXT,delete_flg Integer);";
    
    //ディレクトリの場所を表示する
    NSLog(@"%@", NSHomeDirectory());
    //検索できたらそのコードをスポットライトで検索して出てきたファイルをSQLiteビューワーにドラッグ
    
    // DBオープン
    [db open];
    [db executeUpdate:sql];
    NSString *select = [[NSString alloc] initWithFormat:@"SELECT * from tr_todo"];
    FMResultSet *rs = [db executeQuery:select];
    uid = [NSMutableArray new];
    limit = [NSMutableArray new];
    while([rs next]) {
        [uid addObject:[rs stringForColumn:@"todo_title"]];
        [limit addObject:[rs stringForColumn:@"limit_date"]];
    }
    NSLog(@"aaa%@",uid[0]);
    // DBクローズ
    [db close];
}

//Table Viewのセクション数を指定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 今回はセクション１個
    return 1;
}

//Table Viewのセルの数を指定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 今回は要素８個
    return 2;
}

//各セルの要素を設定する
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"tableCell";
    
    // tableCell の ID で UITableViewCell のインスタンスを生成
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Tag番号 1 で UILabel インスタンスの生成
//    UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
//    titleLabel.text = [NSString stringWithFormat:@"No.%d",(int)(indexPath.row+1)];
    self.titleLabel.text = uid[indexPath.row];
    // Tag番号 2 で UILabel インスタンスの生成
//    UILabel *limitLabel = (UILabel *)[cell viewWithTag:2];
//    limitLabel.text = [NSString stringWithFormat:@"No.%d",(int)(indexPath.row+1)];
    self.limitLabel.text = limit[indexPath.row];
    
    return cell;
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
