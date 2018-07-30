//
//  ViewController.m
//  stv_project2.1.11
//
//  Created by 比留間龍三 on 2018/07/11.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSArray *imgArray;
@property NSArray *label2Array;
@property UIImageView *plist;
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    

    

    self.imgArray = @[@"img0.JPG",@"img1.JPG",@"img2.JPG",@"img3.JPG",
                 @"img4.JPG",@"img5.JPG",@"img6.JPG",@"img7.JPG"];
    self.label2Array = @[@"2013/8/23/16:04",@"2013/8/23/16:15",@"2013/8/23/16:47",@"2013/8/23/17:10",
                    @"2013/8/23/1715:",@"2013/8/23/17:21",@"2013/8/23/17:33",@"2013/8/23/17:41"];
    //使うとテーブルを表示するときに見積もりの高さを先に計算するので、
    //実際のセルの高さの計算を遅らせることができる
    self.table.estimatedRowHeight = 50;
    //ストーリーボード inspecterのrowHeightの高さに指定　↑で高さ指定してるから不要？
    self.table.rowHeight = UITableViewAutomaticDimension;
    
    
}

//Table Viewのセクション数を指定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 今回はセクション１個
    return 2;
}

// セルの高さを設定する
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    float height = 120.0f;
    
    return height;
}

//Table Viewのセルの数を指定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 今回は要素８個
    return 8;
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
    
    UIImage *img = [UIImage imageNamed:self.imgArray[indexPath.row]];
    // Tag番号 1 で UIImageView インスタンスの生成
    self.plist = (UIImageView *)[cell viewWithTag:1];
    self.plist.image = img;
    
    // Tag番号 ２ で UILabel インスタンスの生成
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:2];
    titleLabel.text = [NSString stringWithFormat:@"No.%d",(int)(indexPath.row+1)];
    
    // Tag番号 ３ で UILabel インスタンスの生成
    UILabel *dateLabel = (UILabel *)[cell viewWithTag:3];
    dateLabel.text = self.label2Array[indexPath.row];
    
    return cell;
}

//ヘッダータイトル　　titleForHeaderInSection を　titleForFooterInSection に変更すればフッタータイトル編集できる
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{  //tableView 対象テーブル
    switch (section) { //対象セクション　（section）のところ編集？
        case 0:
            return @"ToykoDisneyLand"; //設定するタイトル
            break;
        case 1:
            return @"TokyoDisneySea";
            break;
        default:
            return @"";
//            return [NSString stringWithFormat:@"%ld 番目のセクションヘッダー", (long)section]; //セクション数で返せる？
            break;
    }
}

@end
