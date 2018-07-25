//
//  AppDelegate.m
//  stv_project2.6.1
//
//  Created by 比留間龍三 on 2018/07/23.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//URL例）scheme://controller/action?query
//下記の感じで受け取れる
//scheme = [url scheme]
//controller = [url host]
//action = [url lastPathComponent]
//query = [url query] などなど


//scheme://user:password@192.168.100.100:5555/#fragment
//例）stv261://ryuzo:password1215@192.168.100.100:5555/#fm1/?key1=value1&key2=value2
//URLで受け取る処理
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
//            NSLog(@"以下URLスキームの取得値");
//            NSLog(@"URL: %@", url);
//            NSLog(@"scheme: %@", url.scheme);
//            NSLog(@"user: %@", url.user);
//            NSLog(@"password: %@", url.password);
//            NSLog(@"host: %@", url.host);
//            NSLog(@"port: %@", url.port);
//            NSLog(@"fragment: %@", url.fragment);
//            NSLog(@"query: %@", url.query);
    
    //stv261://?number=1&english=one&japanese=いち&
    //日本語OKにする
    NSString *encodeUrl = [url.query stringByRemovingPercentEncoding];
    NSLog(@"encode - %@", encodeUrl);
    if (encodeUrl) {
        //空のリストを作成する
        self.result = [NSMutableDictionary new];
        //指定の文字『＆』で文字を分割する。
        NSArray *params = [encodeUrl componentsSeparatedByString:@"&"]; // この文字列で分断してarrayに
        
        for (NSString *param in params) {
            //もし引数paramの中身がから文字でなければ
            if (param.length > 0) {
                //paramの中の値たちを『＝』で分割してelementsにいれる
                NSArray *elements = [param componentsSeparatedByString:@"="];
                id key   = [elements[0] stringByRemovingPercentEncoding];
                id value = (elements.count == 1 ? @YES : [elements[1] stringByRemovingPercentEncoding]);
                [self.result setObject:value forKey:key];
            }
        }
        return [self.result copy];
    } else {
        return YES;
    }
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

