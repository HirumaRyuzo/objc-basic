//
//  ViewController.m
//  stv_project2.5.7
//
//  Created by 比留間龍三 on 2018/07/23.
//  Copyright © 2018年 比留間龍三. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    // Delegate をセット
    self.mapView.delegate = self;
    
    // 緯度・軽度を設定
    CLLocationCoordinate2D location;
    location.latitude = 35.623655;
    location.longitude = 139.724858;
    
    [self.mapView setCenterCoordinate:location animated:NO];
    
    // 縮尺を設定
    MKCoordinateRegion region = self.mapView.region;
    region.center = location;
    region.span.latitudeDelta = 0.02;
    region.span.longitudeDelta = 0.02;
    
    [self.mapView setRegion:region animated:NO];
    
    // 表示タイプを航空写真と地図のハイブリッドに設定
    self.mapView.mapType = MKMapTypeHybrid;

    // view に追加
    [self.view addSubview:self.mapView];
    
    
    
    // ピンを全て削除
    [_mapView removeAnnotations: _mapView.annotations];
    // 新しいピンを作成
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(35.623655, 139.724858);
    annotation.title = @"株式会社スマートテック・ベンチャーズ";
    annotation.subtitle = @"品川年金事務所の上";
    // ピンを追加
    [_mapView addAnnotation:annotation];
}

////画像をピンに刺す
//- (MKAnnotationView *)mapView:(MKMapView *)mapView
//            viewForAnnotation:(id )annotation {
//    static NSString* Identifier = @"AnnotationIdentifier";
//    MKAnnotationView* pinView; // <= MKAnnotationViewを使用する
//    pinView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:Identifier];
//
//   
//
//    if (pinView == nil) {
//        pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation
//                                               reuseIdentifier:Identifier];
//        pinView.image = [UIImage imageNamed:@"img"]; // <= ピンの代わりに使用する画像
//        pinView.canShowCallout = true;
//    }
//    pinView.annotation = annotation;
//    return pinView;
//}


@end
