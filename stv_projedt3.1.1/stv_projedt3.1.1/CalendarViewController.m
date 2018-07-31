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
- (NSDate *)monthAgoDate{
    NSInteger addValue = -1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

//receivrから1ヶ月後の日付を返します。
- (NSDate *)monthLaterDate{
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
@property (nonatomic, strong) NSDate *selectedDate;

@end



@implementation CalendarViewController

#pragma mark - LifeCycle methods

- (void)viewDidLoad{
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


- (void)setSelectedDate:(NSDate *)selectedDate{
    //self.selectedDateだと落ちる...
    _selectedDate = selectedDate;

    //タイトルテキストを更新する
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy/M";
    self.title = [formatter stringFromDate:selectedDate];
    
    //ストーリーボードツールバー表示
    self.navigationController.toolbarHidden = NO;
}


//最初に表示される月
- (NSDate *)firstDateOfMonth{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self.selectedDate];
    components.day = 1;
    
    NSDate *firstDateMonth = [[NSCalendar currentCalendar] dateFromComponents:components];
    return firstDateMonth;
}

//指定されたindexPathの戻り日付
- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath{
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

//曜日のセクションと日付のセクションを分けたい
#pragma mark - UICollectionViewDataSource methods

//曜日と日付のセクション
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

//分けたセクションのセクション0には曜日、セクション1には日付を表示させる
//セクション毎のセルの数（これのみだと月の一週目が2回続くだけになる）
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    if(section==0){//セクション0には曜日の7個
    return self.week.count;

    }else if(section==1) {
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

//インデックスパス毎にセルの内容を作成（Array weekから曜日がうまく呼び出せてない）
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];

    if(indexPath.section==0){//セクション0のセル
        NSString *weekString = [NSString stringWithFormat:@"%@",self.week];
        NSString *weekUTFNonLossyASCIIStringEncoding = [NSString stringWithCString:[weekString cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
        cell.label.text = weekUTFNonLossyASCIIStringEncoding;
        
    }else if(indexPath.section==1){//セクション1のセル
        NSDateFormatter *formatter = [NSDateFormatter new];
        formatter.dateFormat = @"d";
        cell.label.text = [formatter stringFromDate:[self dateForCellAtIndexPath:indexPath]];
        
    }
    return cell;
}

//曜日ラベルに色付けしたい！！
-(void)setupCalendarLabel:(NSArray *)array{
    int calendarTitle = 7;
    
    for(int j=0; j<calendarTitle; j++){
        
        UILabel *calendarBaseLabel = [UILabel new];
//        calendarBaseLabel.frame = CGRectMake(
//                                             calendarLabelIntervalX + calendarLabelX * (j % calendarTitle),
//                                             calendarLabelY,
//                                             calendarLabelWidth,
//                                             calendarLabelHeight
//                                             );
//
        //日曜日のとき「赤」
        if(j == 0){
            calendarBaseLabel.textColor = [UIColor colorWithRed:0.831 green:0.349 blue:0.224 alpha:1.0];
            
            //土曜日のとき「青」
        }else if(j == 6){
            calendarBaseLabel.textColor = [UIColor colorWithRed:0.400 green:0.471 blue:0.980 alpha:1.0];
            
            //平日「グレー」
        }else{
            calendarBaseLabel.textColor = [UIColor lightGrayColor];
        }
        
        //曜日の配置を行う
        calendarBaseLabel.text = [array objectAtIndex:j];
        calendarBaseLabel.textAlignment = NSTextAlignmentCenter;
//        calendarBaseLabel.font = [UIFont systemFontOfSize:calendarLableFontSize];
        [self.view addSubview:calendarBaseLabel];
    }
}


#pragma mark - UICollectionViewDelegateFlowLayout methods

//セルの高さ（セクションindex毎に高さを変更できる）
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section==0){
    NSInteger numberOfMargin = 8;
    CGFloat width = floorf((collectionView.frame.size.width - CellMargin * numberOfMargin) / DaysPerWeek);
    CGFloat height = width * 0.8f;
    return CGSizeMake(width, height);
    
    }else if(indexPath.section==1){
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

