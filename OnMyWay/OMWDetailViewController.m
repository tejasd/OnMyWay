//
//  OMWDetailViewController.m
//  OnMyWay
//
//  Created by Deshpande, Tejas on 10/6/14.
//  Copyright (c) 2014 Dog Forest. All rights reserved.
//

#import "OMWDetailViewController.h"

@interface OMWDetailViewController ()
- (void)configureView;
@property (strong, nonatomic) MKPointAnnotation *pinLocation;
@end

@implementation OMWDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    self.mapView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    if (!self.pinLocation) {
        self.pinLocation = [[MKPointAnnotation alloc] init];
        self.pinLocation.title = @"Where am I?";
        self.pinLocation.subtitle = @"I'm here!!!";
        self.pinLocation.coordinate = userLocation.coordinate;
        [self.mapView addAnnotation:self.pinLocation];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKPinAnnotationView *pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                                             reuseIdentifier:@"current"];
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return  nil;
    }
    pinAnnotationView.animatesDrop = YES;
    pinAnnotationView.draggable = YES;
    pinAnnotationView.pinColor = MKPinAnnotationColorRed;
    return pinAnnotationView;
}

@end
