//
//  UICustomTextField.m
//  stv_project2.1.7
//
//  Created by 比留間龍三 on 2018/07/03.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

//#import "UICustomTextField.h"
//
//@implementation UICustomTextField
//
//@end

#import "UICustomTextField.h"

@implementation UICustomTextField

// ロードされた後に呼び出される
- (void)awakeFromNib {
    [super awakeFromNib];
    // 線幅
    self.layer.borderWidth = 0.5f;
    // 角丸
    self.layer.cornerRadius = 6.0f;
    // 線の色
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

// プレースホルダーを描画
- (void) drawPlaceholderInRect:(CGRect)rect {
    [[self placeholder] drawInRect:CGRectMake(0, 5 , CGRectGetWidth(rect), CGRectGetHeight(rect))
                    withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0],
                                     NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
}

@end

