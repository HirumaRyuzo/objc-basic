//
//  InputViwController.m
//  stv_project2.3.2
//
//  Created by 比留間龍三 on 2018/07/17.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "InputViwController.h"
#import "FMDB.h"

@interface InputViwController (){
    // FMDBオブジェクト
    FMDatabase *db;
}
@end

@implementation InputViwController{

__weak IBOutlet UITextField *inputTitle;
__weak IBOutlet UITextField *inputText;
__weak IBOutlet UILabel *dateLabel;
    
NSUserDefaults *ud;
NSMutableArray *titleArray;
NSMutableArray *sentenceArray;
NSMutableArray *dateArray;

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)save:(id)sender {
    //初期化
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir = [paths objectAtIndex:0];
    FMDatabase *db = [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"test.db"]];
    titleArray = [[NSMutableArray alloc] init];
    sentenceArray = [[NSMutableArray alloc] init];
    
    ud = [NSUserDefaults standardUserDefaults];
    
    if ([inputTitle.text isEqualToString:@""]||[inputText.text isEqualToString:@""]) {
        //空の場合は何もしない
    } else {
    
    //取り出し
    NSArray* array1 = [ud arrayForKey:@"title"];
    for ( NSString* object in array1 ) {
        [titleArray addObject:object];
    }
    
    NSArray* array2 = [ud arrayForKey:@"sentence"];
    for ( NSString* object in array2 ) {
        [sentenceArray addObject:object];
    }
        
    //保存
    [titleArray addObject:inputTitle.text];
    [sentenceArray addObject:inputText.text];

    [ud setObject:titleArray forKey:@"title"];
    [ud setObject:sentenceArray forKey:@"sentence"];
    //保存できてるか確認
//    NSLog(@"タイトル　%@",[ud arrayForKey:@"title"]);
//    NSLog(@"本文　　%@",[ud arrayForKey:@"sentence"]);
    }
    
    // テーブル挿入する変数の宣言
    NSString *title = inputTitle.text;
    NSLog(@"%@",title);
    NSString *sentence = inputText.text;
    //created date 登録日 & modified date 変更日 はnowTime
        NSDate *now = [NSDate date];
        double unixtime = [self convertUnixTimeFromDate:now];
        NSDate *now2 = [self convertDateFromUnixTime:unixtime];
    NSDate *nowTime = now2;
//    limit_date date 期限日
    NSString *limitTime = dateLabel.text;
//    delete_flg 削除フラグ
    NSNumber *delete = @0;


    NSString * insert =
    @"INSERT INTO tr_todo(todo_title,todo_contents,created,modified,limit_date,delete_flg) VALUES(?, ?, ?, ?, ?, ?);";
    [db open];
    
    NSLog(@"%@",db);
        BOOL ret = [db executeUpdate:insert, title, sentence, nowTime, nowTime, limitTime, delete]; // execute 実行

//    //ビューコンの出力する場所のプロパティを宣言して「teString」のとこに代入
//    self.teString.text = [self.teString.textstringByAppendingFormat:@"テーブル挿入：%@\n", ret ? @"YES" :@"NO"];


    [db close];
    //処理が終わったら画面を閉じる
    [self dismissViewControllerAnimated:YES completion:nil];
}

//NSDate型をUNIX時間に変換する処理
- (double)convertUnixTimeFromDate:(NSDate *)date{
    double unixtime = [date timeIntervalSince1970];
    return unixtime;
}
//UNIX時間をNSDate型に変換する処理
- (NSDate *)convertDateFromUnixTime:(double)unixtime{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:unixtime];
    return date;
}//↑なう時間

// タッチイベントを取る
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [inputTitle resignFirstResponder];
    [inputText resignFirstResponder];
}

//DatePickerを操作した時
- (IBAction)chageDate:(id)sender {
    //初期化
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //日付のフォーマット指定
    dateFormatter.dateFormat = @"yyyy/MM/dd HH:mm";
    //ラベルに日付を表示
    dateLabel.text = [dateFormatter stringFromDate:self.datePicker.date];
}
@end
