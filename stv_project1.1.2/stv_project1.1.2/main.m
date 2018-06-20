//
//  main.m
//  stv_project1.1.2
//
//  Created by 比留間　龍三 on 2018/06/07.
//  Copyright © 2018年 h. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
    
//        NSArray型、NSDictonary型の変数を定義し、
//        でコンソールにログを出力する。


        NSArray *arr = @[@"Disney",@"Mickey Mouse",@"ミッキーマウス"];
        NSLog(@"%@",arr[0]);//Disney
        NSLog(@"%@",arr[1]);//Mickey Mouse
        NSLog(@"%@",arr[2]);//ミッキーマウス

        NSDictionary *metro = @{@"G": @"銀座線",
                                @"M": @"丸ノ内線",
                                @"H":@"日比谷線",
                                @"T": @"東西線",
                                @"C": @"千代田線",
                                @"Y": @"有楽町線",
                                @"Z": @"半蔵門線",
                                @"N": @"南北線",
                                @"F": @"副都心線",};
        
        NSString *mt = metro[@"N"];
        NSLog(@"%@", mt);
        
    }
    return 0;
}
