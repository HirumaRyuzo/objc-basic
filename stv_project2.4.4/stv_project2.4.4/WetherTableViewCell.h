//
//  WetherTableViewCell.h
//  stv_project2.4.4
//
//  Created by 比留間龍三 on 2018/07/19.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WetherTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellTelop;
@property (weak, nonatomic) IBOutlet UIImageView *cellImg;

@end
