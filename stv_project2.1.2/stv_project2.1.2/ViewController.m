//
//  ViewController.m
//  stv_project2.1.2
//
//  Created by 比留間　龍三 on 2018/06/15.
//  Copyright © 2018年 h. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    以下は画像のサイズを取得してUIImageのサイズを合わせる方法のメモ
//    CGFloat imageMargin = 20;
//    CGFloat width = [UIScreen mainScreen].bounds.size.width - imageMargin * 2;
//
//    UIImage *image = [UIImage imageNamed:@"mm2"];
//    CGFloat imageWidth = image.size.width;
//    CGFloat imageHeight = image.size.height;
//
//    CGFloat w = width / imageWidth;
//    CGFloat h = imageHeight * w;
//
//    // 画像リサイズ
//    UIImage * resizeImage = [image btk_ImageResized:CGSizeMake(width, h)];
//
//    //UIImageViewの生成
//    UIImageView *imageView = [[UIImageView alloc] initWithImage: resizeImage];
//    imageView.frame = CGRectMake(20, 100, width, h);
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [self.view addSubview:imageView];
//
//    [imageView layer].masksToBounds = YES;
//    [imageView layer].cornerRadius = 10;
}
@end

@implementation UIImage (Additional)
//
//- (UIImage*) btk_ImageResized : (CGSize)size
//{
//    if(CGSizeEqualToSize(self.size, size) && self.imageOrientation == UIImageOrientationUp){
//        // No need to resize nor convert orientation
//        return self;
//    }
//    UIGraphicsBeginImageContext(size);
//    @try {
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
//        [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
//        return UIGraphicsGetImageFromCurrentImageContext();
//    }
//    @finally {
//        UIGraphicsEndImageContext();
//    }
//}
@end
