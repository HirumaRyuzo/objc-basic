//
//  DataSaveHelper.h
//  stv_project2.2.1
//
//  Created by 比留間龍三 on 2018/07/16.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface DataSaveHelper : UIViewController
//
//@end

#import "Foundation/Foundation.h"
@interface DataSaveHelper : NSObject
@property (nonatomic) BOOL initialized;
@property (nonatomic) NSInteger howManyTimesAppLaunched;
@end
