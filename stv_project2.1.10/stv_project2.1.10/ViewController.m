//
//  ViewController.m
//  stv_project2.1.10
//
//  Created by 比留間龍三 on 2018/07/11.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController{
    NSArray *imgArray;
    NSArray *label2Array;
    UIImageView *plist;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
    imgArray = @[@"img0.JPG",@"img1.JPG",@"img2.JPG",@"img3.JPG",
                 @"img4.JPG",@"img5.JPG",@"img6.JPG",@"img7.JPG"];
    label2Array = @[@"2013/8/23/16:04",@"2013/8/23/16:15",@"2013/8/23/16:47",@"2013/8/23/17:10",
                    @"2013/8/23/1715:",@"2013/8/23/17:21",@"2013/8/23/17:33",@"2013/8/23/17:41"];
    
    _table.estimatedRowHeight = 50;
    _table.rowHeight = UITableViewAutomaticDimension;
    
}

//Table Viewのセクション数を指定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 今回はセクション１個
    return 1;
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
    
    UIImage *img = [UIImage imageNamed:imgArray[indexPath.row]];
    // Tag番号 1 で UIImageView インスタンスの生成
    plist = (UIImageView *)[cell viewWithTag:1];
    plist.image = img;
    
    // Tag番号 ２ で UILabel インスタンスの生成
    UILabel *label1 = (UILabel *)[cell viewWithTag:2];
    label1.text = [NSString stringWithFormat:@"No.%d",(int)(indexPath.row+1)];
    
    // Tag番号 ３ で UILabel インスタンスの生成
    UILabel *label2 = (UILabel *)[cell viewWithTag:3];
    label2.text = label2Array[indexPath.row];
    
    return cell;
}

// セルの高さを設定する
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    float height = 120.0f;
    
    return height;
}

@end
