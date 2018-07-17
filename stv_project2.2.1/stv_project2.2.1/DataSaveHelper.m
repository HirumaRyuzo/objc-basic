//
//  DataSaveHelper.m
//  stv_project2.2.1
//
//  Created by 比留間龍三 on 2018/07/16.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "DataSaveHelper.h"

@interface DataSaveHelper ()
@end

static NSString *const kKeyInitialized = @"initialized";
static NSString *const kKeyHowManyTimesAppLaunched = @"howManyTimesAppLaunched";

@implementation DataSaveHelper

- (BOOL)initialized{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kKeyInitialized];
}

- (void)setInitialized:(BOOL)initialized{
    [[NSUserDefaults standardUserDefaults] setBool:initialized forKey:kKeyInitialized];
}

- (NSInteger)howManyTimesAppLaunched{
    return [[NSUserDefaults standardUserDefaults] integerForKey:kKeyHowManyTimesAppLaunched];
}

- (void)setHowManyTimesAppLaunched:(NSInteger)howManyTimesAppLaunched{
    [[NSUserDefaults standardUserDefaults] setInteger:howManyTimesAppLaunched forKey:kKeyHowManyTimesAppLaunched];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//}
@end
