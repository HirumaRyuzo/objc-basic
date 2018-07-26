//
//  AppDelegate.h
//  stv_project2.5.8
//
//  Created by 比留間龍三 on 2018/07/23.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import UserNotifications;

@interface AppDelegate : UIResponder<UIApplicationDelegate, FIRMessagingDelegate, UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

