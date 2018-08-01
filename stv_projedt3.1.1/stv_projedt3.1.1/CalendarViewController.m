//
//  CalendarViewController.m
//  stv_projedt3.1.1
//
//  Created by 比留間龍三 on 2018/07/31.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "CalendarViewController.h"
#import "DayCell.h"

@implementation NSDate (Extension)

//1ヶ月前の日付を返します。
- (NSDate *)monthAgoDate {
    NSInteger addValue = -1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

//receivrから1ヶ月後の日付を返します。
- (NSDate *)monthLaterDate {
    NSInteger addValue = 1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

@end

static NSString *const ReuseIdentifier = @"Cell";
static NSUInteger const DaysPerWeek = 7;
static CGFloat const CellMargin = 2.0f;

@interface CalendarViewController ()

@property (nonatomic) NSArray *week;
//カレンダーで選択された日付表示
@property (nonatomic) NSDate *selectedDate;
//参照されても解放されない

@end


@implementation CalendarViewController

#pragma mark - LifeCycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    //今月を表示する
    self.selectedDate = [NSDate date];
    self.week = @[@"月", @"火", @"水", @"木",@"金", @"土", @"日"];
}

#pragma mark - Action methods

- (IBAction)didTapPrevButton:(id)sender {
    self.selectedDate = [self.selectedDate monthAgoDate];
    [self.collectionView reloadData];
}

- (IBAction)didTapNextButton:(id)sender {
    self.selectedDate = [self.selectedDate monthLaterDate];
    [self.collectionView reloadData];
}

#pragma mark - private methods

- (void)setSelectedDate:(NSDate *)selectedDate {
    //self.selectedDateだと落ちる...
    _selectedDate = selectedDate;

    //タイトルテキストを更新する
    NSDateFormatter *titleText = [NSDateFormatter new];
    titleText.dateFormat = @"yyyy年M月";
    self.title = [titleText stringFromDate:selectedDate];
    
    //ストーリーボードツールバー表示
    self.navigationController.toolbarHidden = NO;
}

//最初に表示される月
- (NSDate *)firstDateOfMonth {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self.selectedDate];
    components.day = 1;
    
    NSDate *firstDateMonth = [[NSCalendar currentCalendar] dateFromComponents:components];
    return firstDateMonth;
}

//指定されたindexPathの戻り日付
- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath {
    //「月の初日が週の何日目か」を計算する
    NSInteger ordinalityOfFirstDay = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay
                                                                             inUnit:NSCalendarUnitWeekOfMonth
                                                                            forDate:self.firstDateOfMonth];
    
    //「月の初日」と「indexPath.item番目のセルに表示する日」の差を計算する
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.day = indexPath.item - (ordinalityOfFirstDay - 1);
    
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                 toDate:self.firstDateOfMonth
                                                                options:0];
    return date;
}

#pragma mark - UICollectionViewDataSource methods

//曜日と日付のセクションに分ける
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

//分けたセクションのセクション0には曜日、セクション1には日付を表示させる
//セクション毎のセルの数（これのみだと月の一週目が2回続くだけになる）
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    if(section == 0) {//セクション0には曜日の7個
    return self.week.count;

    }else if (section == 1) {
//    セクション1では週数を計算
    NSRange rangeOfWeeks = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth
                                                              inUnit:NSCalendarUnitMonth
                                                             forDate:self.firstDateOfMonth];
    NSUInteger numberOfWeeks = rangeOfWeeks.length;
    NSInteger numberOfItems = numberOfWeeks * DaysPerWeek;
        return numberOfItems;
}
    return 0;
}

//セルの内容をインデックスパス指定で作成
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];

    //セルを指定して曜日によって文字色を変える
    if (indexPath.row % 7 == 0) {//0の位置＝1番左の列＝日曜日の文字色が赤
        cell.label.textColor = [UIColor colorWithRed:0.831 green:0.349 blue:0.224 alpha:1.0];
    }else if (indexPath.row % 7 == 6) {//6の位置＝1番右の列＝土曜日の文字色が青
        cell.label.textColor = [UIColor colorWithRed:0.400 green:0.471 blue:0.980 alpha:1.0];
    }else {//今月の日付＝黒
        cell.label.textColor = [UIColor blackColor];
    }
    
    if(indexPath.section == 0) {//セクション0のセルは曜日
        cell.label.text = self.week[indexPath.row];
    
    }else if (indexPath.section == 1) {//セクション1のセルは日付
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"d";
        cell.label.text = [dateFormatter stringFromDate: [self dateForCellAtIndexPath:indexPath]];

    }
    return cell;
}

#pragma mark - UICollectionViewLayout methods
//セルの高さ（セクションindex毎に高さを変更できる）
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 0) {
    NSInteger numberOfMargin = 8;
    CGFloat width = floorf((collectionView.frame.size.width - CellMargin * numberOfMargin) / DaysPerWeek);
    CGFloat height = width * 0.8f;
    return CGSizeMake(width, height);
    
    }else if (indexPath.section == 1) {
    NSInteger numberOfMargin = 8;
    CGFloat width = floorf((collectionView.frame.size.width - CellMargin * numberOfMargin) / DaysPerWeek);
    CGFloat height = width * 1.7f;
    return CGSizeMake(width, height);
    }
    return CGSizeMake(100, 100);//100て?
}

//セクションの上下左右のマージン
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(CellMargin, CellMargin, CellMargin, CellMargin);
}

//垂直方向のセル間のマージンの最小値
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return CellMargin;
}

//水平方向のセル間のマージンの最小値
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return CellMargin;
}

@end
