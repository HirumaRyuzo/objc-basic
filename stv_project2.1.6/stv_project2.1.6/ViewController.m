//
//  ViewController.m
//  stv_project2.1.6
//
//  Created by 比留間龍三 on 2018/07/03.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

//#import "ViewController.h"
//
//@interface UIViewController ()
//@end
//
//@implementation ViewController
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    //ウェブビューの生成
//    webView_ = [[UIWebView alloc] init];
//    webView_.frame = self.view.bounds;
//    webView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    webView_.scalesPageToFit = YES;
//    [self.view addSubview:webView_];
//    //リクエストの生成
//    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/"]];
//    [webView_ loadRequest:request];
//}
//@end


#import "ViewController.h"

@interface UIViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // UIWebViewのインスタンス初期化
    WKWebView *wkWebView = [[WKWebView alloc]init];

    // デリゲート
    wkWebView.UIDelegate = self;

    // Webページの大きさを画_webView合わせる
    // iPhoneXではSafeAreaの考慮が必要
    CGRect rect = self.view.frame;
    wkWebView.frame = rect;

    // インスタンスをビューに追加する
    [self.view addSubview:wkWebView];

    // URLを指定
    NSURL *url = [NSURL URLWithString:@"https://www.tokyodisneyresort.jp/tdl/"];
//    NSURL *url = [NSURL URLWithString:@"https://www.apple.com/iphone/"];
//    NSURL *url = [NSURL URLWithString:@"http://www.apple.com/iphone/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // リクエストを投げる
    [wkWebView loadRequest:request];
    [wkWebView reload];
    [wkWebView goForward];
    [wkWebView goBack];
    [wkWebView canGoBack];
    [wkWebView canGoForward];
}

@end
