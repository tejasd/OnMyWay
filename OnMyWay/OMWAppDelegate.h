//
//  OMWAppDelegate.h
//  OnMyWay
//
//  Created by Deshpande, Tejas on 10/6/14.
//  Copyright (c) 2014 Dog Forest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
