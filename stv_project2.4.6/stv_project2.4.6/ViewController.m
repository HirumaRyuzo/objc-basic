//
//  ViewController.m
//  stv_project2.4.6
//
//  Created by 比留間龍三 on 2018/07/20.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"
//フレームワークのimportの場合”@import”で簡略化できる
@import Photos;
@import FBSDKShareKit.FBSDKSharePhoto;
@import FBSDKShareKit.FBSDKSharePhotoContent;
@import FBSDKShareKit.FBSDKShareDialog;

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property FBSDKSharePhotoContent *content;
//@property (nonatomic, copy) NSArray *photos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//共有ボタンを押した時の動作
- (IBAction)imageShareButton:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}
//写真を選択した時のメソッド
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    // まずはmodalを閉じないとhierarchy errorがでる
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // 選択したイメージを受け取る
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    FBSDKSharePhoto *photo = [FBSDKSharePhoto new];
    photo.image = image;
    photo.userGenerated = YES;
//    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    self.content = [FBSDKSharePhotoContent new];
    self.content.photos = @[photo];
    //シェアダイアログ
    [FBSDKShareDialog showFromViewController:self
                                 withContent:self.content
                                    delegate:nil];
}

// キャンセル押した時のメソッド
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"Cancel");
}

@end
