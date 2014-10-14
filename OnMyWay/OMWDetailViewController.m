//
//  OMWDetailViewController.m
//  OnMyWay
//
//  Created by Deshpande, Tejas on 10/6/14.
//  Copyright (c) 2014 Dog Forest. All rights reserved.
//

#import "OMWDetailViewController.h"

@interface OMWDetailViewController ()
@end

@implementation OMWDetailViewController

#pragma mark - View Lifecycle

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

- (void)viewWillDisappear:(BOOL)animated
{
    [self.delegate recievePin:self.pinLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions and outlets

- (IBAction)resetPinAction:(id)sender {
    [self resetPin];
    
}

#pragma mark - map view delegate methods

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

#pragma mark - misc

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
