//
//  ViewController.m
//  stv_project2.4.8
//
//  Created by 比留間龍三 on 2018/07/23.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"
#import "instagram.h"

@interface ViewController ()
<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIDocumentInteractionControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self imagePost];
}

//投稿メソッド
- (void)imagePost {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *imagePicker = [UIImagePickerController new];
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.allowsEditing = YES;
        imagePicker.delegate = self;
        
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    // カメラロールから画像取得→instagramのURL Schemeを起動する
    if ([instagram canInstagramOpen]) {
        instagram *instagramViewController = [[instagram alloc] init];
        [instagramViewController setImage:image];
        [self.view addSubview:instagramViewController.view];
        [self addChildViewController:instagramViewController];
    } else {
        NSLog(@"Scheme起動できず");
    }
}

@end
