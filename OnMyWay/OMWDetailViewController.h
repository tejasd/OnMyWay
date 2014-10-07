//
//  OMWDetailViewController.h
//  OnMyWay
//
//  Created by Deshpande, Tejas on 10/6/14.
//  Copyright (c) 2014 Dog Forest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface OMWDetailViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
