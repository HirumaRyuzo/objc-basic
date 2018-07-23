//
//  instagramViewController.h
//  stv_project2.4.8
//
//  Created by 比留間龍三 on 2018/07/23.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

@import UIKit;

@interface instagram : UIViewController <UIDocumentInteractionControllerDelegate>

+ (BOOL)canInstagramOpen;
- (void)setImage:(UIImage *)image;

@property (nonatomic, retain) UIDocumentInteractionController *interactionController;

@end
