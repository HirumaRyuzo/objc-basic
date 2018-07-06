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

// WKWebViewがストーリーボードからデコードされたときにアプリが理解できるように、アプリケーションターゲットをWebKitフレームワークにリンクする必要があります。
//https://translate.googleusercontent.com/translate_c?depth=1&hl=ja&prev=search&rurl=translate.google.com&sl=en&sp=nmt4&u=https://stackoverflow.com/questions/47142434/ios11-wkwebview-crash-due-to-nsinvalidunarchiveoperationexception&xid=17259,15700002,15700021,15700124,15700149,15700168,15700186,15700191,15700201,15700208&usg=ALkJrhi5ZO-PzytkwZrUYMjTd0tw1-ejLQ

#import "ViewController.h"

@interface UIViewController ()
@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    // デリゲート
    self.wkWebView.UIDelegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Webページの大きさを画_webView合わせる
    // iPhoneXではSafeAreaの考慮が必要
//    CGRect rect = self.view.frame;
//    self.wkWebView.frame = rect;
    // インスタンスをビューに追加する
//    [self.view addSubview:self.wkWebView];
//    [self.view addSubview:_toolBar];
    
    // URLを指定
//    NSURL *url = [NSURL URLWithString:@"https://www.tokyodisneyresort.jp/tdl/"];
    NSURL *url = [NSURL URLWithString:@"http://www.metro.tokyo.jp/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // リクエストを投げる
    [self.wkWebView loadRequest:request];
    
//    フリックで戻る＆進む
    self.wkWebView.allowsBackForwardNavigationGestures = true;
}

- (IBAction)goBack:(id)sender {
    [self.wkWebView goBack ];
}

- (IBAction)goForward:(id)sender {
    [self.wkWebView goForward ];
}

- (IBAction)reload:(id)sender {
    [self.wkWebView reload ];
}
@end

