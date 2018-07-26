//
//  ViewController.m
//  stv_project2.1.12
//
//  Created by 比留間龍三 on 2018/07/11.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSArray *photos;
@property NSArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 配列要素
    self.photos = @[@"mickey", @"minnie", @"chip", @"dale",
               @"pooh", @"piglet", @"r2d2", @"c3po",@"darth", @"storm"];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell;
    //dequeueReusableCellWithReuseIdentifier の働きは再利用できるセルがあればそれを使う
    // 再利用できるセルがなければ生成する
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    //storyboard上の画像につけたタグに合わせて UIImageView のインスタンスを生成
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    // 配列のindexをcellのindexと同じにする
    NSString *imgName = self.photos[indexPath.row];
    // 配列の名前の画像を呼び出す
    UIImage *image = [UIImage imageNamed:imgName];
    // UIImageをimageViewの画像として設定
    imageView.image = image;
    
    UILabel *label = (UILabel *)[cell viewWithTag:2];
    label.text = self.photos[indexPath.row];
    
    return cell;
}

@end
