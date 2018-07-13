//
//  ViewController.m
//  stv_project2.1.10
//
//  Created by 比留間龍三 on 2018/07/11.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSUInteger, Class){
    cell0 = 0,
    cell1,
};

@interface ViewController ()
@property NSArray *cell0;
@property NSArray *cell1;
@property UIImageView *plist;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.item0 = @[@"img0.JPG",@"img1.JPG",@"img2.JPG",@"img3.JPG",
//                 @"img4.JPG",@"img5.JPG",@"img6.JPG",@"img7.JPG"];
//    self.item1= @[@"2013/8/23/16:04",@"2013/8/23/16:15",@"2013/8/23/16:47",@"2013/8/23/17:10",
//                    @"2013/8/23/1715:",@"2013/8/23/17:21",@"2013/8/23/17:33",@"2013/8/23/17:41"];
    
//    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
//    NSBundle *bundle = [NSBundle mainBundle];
//    //読み込むプロパティリストのファイルパスを指定
//    NSString *path = [bundle pathForResource:@"imageList" ofType:@"plist"];
//    //プロパティリストの中身データを取得
//    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
//    NSArray *cell0 = [dic objectForKey:@"cell0"];
//    NSArray *cell1 = [dic objectForKey:@"cell1"];
//
//    //取得できた配列データをメンバ変数に代入
//    self.cell0 = cell0;
//    self.cell1 = cell1;

//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"imageList.plist" ofType:nil];
//    NSData *plistData = [NSData dataWithContentsOfFile:filePath];
//    NSPropertyListFormat format = NSPropertyListXMLFormat_v1_0;
//    NSError *error;
//    id lists = [NSPropertyListSerialization propertyListWithData:plistData options:(NSPropertyListReadOptions)NSPropertyListImmutable format:&format error:&error];
//    if (!lists) {
//        return;
//    }
//    for (NSDictionary *list in lists) {
//        NSLog(@"imageName:%@", list[@"imageName"]);
//        NSLog(@"label1:%@", list[@"label1"]);
//        NSLog(@"label2:%@", list[@"label2"]);
//    }

//    _tableView.estimatedRowHeight = 50;  高さ
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

//Table Viewのセクション数を指定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // セクション数
    return 2;
}

//Table Viewのセルの数を指定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 今回は要素８個
    return self.cell0.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // セクションタイトルの文字列変数を宣言
    NSString *title;
    
    // 表示しているセクションのタイトルを
    switch (section) {
        case cell0:
            title = @"section1";
            break;
        case cell1:
            title = @"section2";
            break;
        default:
            break;
    }
    return title;
}

////各セルの要素を設定する
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
////    static NSString *CellIdentifier = @"tableCell";
//
//    // tableCell の ID で UITableViewCell のインスタンスを生成
//    UITableViewCell *cell =
//    [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
//
////    if(cell==nil){
////        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier: @"tableCell"];
////    }
//
//    UIImage *img = [UIImage imageNamed:self.item0[indexPath.row]];
//    // Tag番号 1 で UIImageView インスタンスの生成
//    self.plist = (UIImageView *)[cell viewWithTag:1];
//    self.plist.image = img;
//
//    // Tag番号 ２ で UILabel インスタンスの生成
//    UILabel *label1 = (UILabel *)[cell viewWithTag:2];
//    label1.text = [NSString stringWithFormat:@"No.%d",(int)(indexPath.row+1)];
//
//    // Tag番号 ３ で UILabel インスタンスの生成
//    UILabel *label2 = (UILabel *)[cell viewWithTag:3];
//    label2.text = self.item1[indexPath.row];
//
//    return cell;
//}

//// セルの高さを設定する
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    float height = 120.0f;
//
//    return height;
//}

@end
