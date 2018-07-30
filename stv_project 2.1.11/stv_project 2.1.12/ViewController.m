//
//  ViewController.m
//  stv_project 2.1.12
//
//  Created by kazua on 2018/01/26.
//  Copyright © 2018年 kazua. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

//列挙型の宣言と対応するマクロの作成
typedef NS_ENUM(NSInteger, Class){
    toykoDisneyLand = 0,
    toykoDisneySea,
};

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong,nonatomic) NSArray *imgTdl;
@property (strong,nonatomic) NSArray *imgTds;
@property (strong,nonatomic) NSArray *imgTdlTitles;
@property (strong,nonatomic) NSArray *imgTdsTitles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imgTdl = @[[UIImage imageNamed:@"img1"],
                       [UIImage imageNamed:@"img2"],
                       [UIImage imageNamed:@"img3"]];
    self.imgTds   = @[[UIImage imageNamed:@"img4"],
                       [UIImage imageNamed:@"img5"],
                       [UIImage imageNamed:@"img6"]];
    
    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
    NSBundle *bundle = [NSBundle mainBundle];
    //読み込むプロパティリストのファイルパスを指定
    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    //プロパティリストの中身データを取得
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *tdl = [dictionary objectForKey:@"ToykoDisneyLand"];
    NSArray *tds = [dictionary objectForKey:@"ToykoDisneySea"];
    
    //取得できた配列データをメンバ変数に代入
    self.imgTdlTitles = tdl;
    self.imgTdsTitles   = tds;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // セクションタイトルの文字列変数を宣言
    NSString *title;
    // 表示しているセクションのタイトルを
    switch (section) {
        case toykoDisneySea:
            title = @"ToykoDisneySea";
            break;
        case toykoDisneyLand:
            title = @"ToykoDisneyLand";
            break;
        default:
            break;
    }
    return title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //データの数によって行数が増える。
    NSInteger rows = 0;
    switch (section) {
        case toykoDisneySea:
            rows = [self.imgTds count];
            break;
        case toykoDisneyLand:
            rows = [self.imgTdl count];
            break;
        default:
            break;
    }
    return rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = (CustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"forIndexPath:indexPath];
    
    UIImage *itemImg;
    switch (indexPath.section) {
        case toykoDisneySea:
            itemImg = self.imgTds[indexPath.row];
            break;
        case toykoDisneyLand:
            itemImg = self.imgTdl[indexPath.row];
            break;
        default:
            break;
    }

    NSString *itemName;
    switch (indexPath.section) {
        case toykoDisneySea:
            itemName = self.imgTdsTitles[indexPath.row];
            break;
        case toykoDisneyLand:
            itemName = self.imgTdlTitles[indexPath.row];
            break;
        default:
            break;
    }

    cell.myImageView.image = itemImg;
    cell.myImageTitle.text = itemName;
    return cell;
}

@end
