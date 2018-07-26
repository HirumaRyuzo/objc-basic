//
//  instagramViewController.m
//  stv_project2.4.8
//
//  Created by 比留間龍三 on 2018/07/23.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "instagram.h"

@interface instagram()

- (void)closeView;

@end

@implementation instagram

+ (BOOL)canInstagramOpen {
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://app"];
    // instagram が　open できれば
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        return YES;
    }
    return NO;
}

- (void)openInstagram {
    // Instagram用の投稿画像を作る
    // .igo型にする
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.igo"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    
    // interactionControllerは直接ファイルフォーマットを処理できないファイルをプレビュー、開く、印刷するviewController
    self.interactionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
    // instagramだけを対象にする場合に記載する
    self.interactionController.UTI = @"com.instagram.exclusivegram";
    self.interactionController.delegate = self;
    
    BOOL present = [self.interactionController presentOpenInMenuFromRect:self.view.frame inView:self.view animated:YES];
    if (!present) {
        [self closeView];
    }
}

- (void)setImage:(UIImage *)image {
    // NSDataに変換する　0.75fは画像のクオリティ指数
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75f);
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.igo"];
    [imageData writeToFile:filePath atomically:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [self openInstagram];
}

//ファイルを他のアプリに送信する
- (void)documentInteractionController:(UIDocumentInteractionController *)controller
           didEndSendingToApplication:(NSString *)application {
    [self closeView];
}

- (void)closeView {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    self.interactionController.delegate = nil;
}

- (void)documentInteractionController:(UIDocumentInteractionController *)controller
        willBeginSendingToApplication:(NSString *)application{
}

- (void) documentInteractionControllerDidDismissOpenInMenu: (UIDocumentInteractionController *) controller {
    // キャンセルで閉じたとき
    [self closeView];
}

@end
