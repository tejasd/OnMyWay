//
//  OMWDetailViewController.m
//  OnMyWay
//
//  Created by Deshpande, Tejas on 10/6/14.
//  Copyright (c) 2014 Dog Forest. All rights reserved.
//

#import "OMWDetailViewController.h"

@interface OMWDetailViewController ()
@property (strong, nonatomic) MKPointAnnotation *pinLocation;
@end

@implementation OMWDetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mapView.delegate = self;
    if (self.pinLocation) {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.pinLocation.coordinate, 800, 800);
        [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // Add an annotation
    if (!self.pinLocation) {
        self.pinLocation = [[MKPointAnnotation alloc] init];
        [self.mapView addAnnotation:self.pinLocation];
        [self resetPin];
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
- (IBAction)resetPinAction:(id)sender {
    [self resetPin];
    
}

/**
 Reset the pin back to user location
 */
- (void)resetPin
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    self.pinLocation.coordinate = self.mapView.userLocation.coordinate;
}

@end
