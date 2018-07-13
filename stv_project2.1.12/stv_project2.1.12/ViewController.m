//
//  ViewController.m
//  stv_project2.1.12
//
//  Created by 比留間龍三 on 2018/07/11.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *photos;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 配列要素
    photos = @[@"mickey", @"minnie", @"chip", @"dale",
               @"pooh", @"piglet", @"r2d2", @"c3po",@"darth", @"storm"];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    //section 数の設定、今回は１つにセット
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    // itemの数を設定する、配列の全要素数を入れる
    return photos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell;
    //dequeueReusableCellWithReuseIdentifier の働きは再利用できるセルがあればそれを使う
    // 再利用できるセルがなければ生成する
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    //storyboard上の画像につけたタグに合わせて UIImageView のインスタンスを生成
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    // 配列のindexをcellのindexと同じにする
    NSString *imgName = photos[(int)(indexPath.row)];
    // 配列の名前の画像を呼び出す
    UIImage *image = [UIImage imageNamed:imgName];
    // UIImageをimageViewの画像として設定
    imageView.image = image;
    
    UILabel *label = (UILabel *)[cell viewWithTag:2];
    label.text = photos[(int)(indexPath.row)];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////画面サイズに合ったセルサイズを計算して合わせこみをします
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    int screenWidth = self.view.frame.size.width;
//    // ２列、セル横スペース
//    CGFloat cellframe = screenWidth/2-2;
//    
//    return CGSizeMake(cellframe, cellframe);
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView
//                   layout:(UICollectionViewLayout*)collectionViewLayout
//minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    // セル縦スペース
//    return 4;
//}
@end
