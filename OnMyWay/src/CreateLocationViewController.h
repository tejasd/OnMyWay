//
//  CreateLocationViewController.h
//  OnMyWay
//
//  Created by Godakanda, Hashan on 10/6/14.
//  Copyright (c) 2014 Dog Forest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OMWDetailViewController.h"
#import "OMWGeoFence.h"

@interface CreateLocationViewController : UITableViewController <UITableViewDelegate, OMWDetailViewDelegate>

@property(nonatomic, strong)OMWGeoFence *thisGeoFence;
@property(nonatomic, strong)id detailObject;

@end
