//
//  Model.h
//  stv_project2.4.4
//
//  Created by 比留間龍三 on 2018/07/19.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

- (void)registerWether: (NSMutableArray *)registerContent;

- (BOOL)checkDBTable;

@end
