//
//  MasterViewController.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 04.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

#import <CoreData/CoreData.h>
#import "CoreDataTableViewController.h"

@interface MasterViewController : CoreDataTableViewController 
@property (strong, nonatomic) DetailViewController *detailViewController;
@property (nonatomic, strong) UIManagedDocument *signalDatabase;  // Model is a Core Data database of signals


@end
