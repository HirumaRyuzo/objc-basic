//
//  ViewController.m
//  stv_project2.1.10
//
//  Created by 比留間龍三 on 2018/07/11.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *cellTable;

@property (nonatomic) NSArray *DName;
@property (nonatomic) NSArray *DImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Assetから写真をarrayに代入
    self.DImg = @[[UIImage imageNamed:@"img0"],
                       [UIImage imageNamed:@"img1"],
                       [UIImage imageNamed:@"img4"]];
    
    // plistとbundleする
    NSBundle *bundle  = [NSBundle mainBundle];
    // ファイルパスを通す
    NSString *path    = [bundle pathForResource:@"dList" ofType:@"plist"];
    // plistのデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *disney   = [dic objectForKey:@"disney"];
    // インスタンス変数に代入する
    self.DName = disney;
}

// cellを可変にする
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[self tableView:self.cellTable cellForRowAtIndexPath:indexPath];
    
    return cell.frame.size.height;
}

// セクションの数を指定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

// セルの数を指定 要素の数によって可変にする
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.DImg count];
}

// 各セルの要素を指定 tagで指定する
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // テーブルセルの IDで インスタンスを生成
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UIImage *img = self.DImg[indexPath.row];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = img;
    
    UILabel *label = (UILabel *)[cell viewWithTag:2];
    label.text = self.DName[indexPath.row];
    
    return cell;
}

@end
