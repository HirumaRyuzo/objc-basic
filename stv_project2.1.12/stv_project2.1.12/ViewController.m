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
    NSArray *titles;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 配列要素
    photos = @[@"mickey", @"minnie", @"chip", @"dale",
               @"pooh", @"piglet", @"r2d2", @"c3po",@"darth", @"storm"];
    titles = @[
               @"TokyoDisneyLand",
               @"TokyoDisneySea",
               ];
}

//セクション数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    // itemの数を設定する、配列の全要素数を入れる
    return photos.count;
////    セクション毎の表示するセルの数
//    if (section == 0) {
//        return 2;
//    }
//    else{
//        return 4;
//    }
}

- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView* reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        // --- ヘッダ
        UICollectionReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                  withReuseIdentifier:@"HeaderView"
                                                                                         forIndexPath:indexPath];
        UILabel *label = [headerView viewWithTag:1];
        label.text = titles[indexPath.section];
        reusableview = headerView;
    }
    return reusableview;
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

////1つ目のコレクションViewを正方形2列で並べて、2目のコレクションViewを正方形3列で並べる
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    if (indexPath.section == 0) {
//        // 正方形で横に２つ並べる
//        float size = (self.collectionView.frame.size.width - 10) / 2;
//        return CGSizeMake(size, size);
//    }
//    else{
//        // 正方形で横に３つ並べる
//        float size = (self.collectionView.frame.size.width - 10 * 2) / 3;
//        return CGSizeMake(size, size);
//    }
//}

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
