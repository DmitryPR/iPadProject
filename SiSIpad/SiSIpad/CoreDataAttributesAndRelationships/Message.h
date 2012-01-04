//
//  Message.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 04.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ComputerSystem;

@interface Message : NSManagedObject

@property (nonatomic, retain) NSNumber * messageID;
@property (nonatomic, retain) NSString * value;
@property (nonatomic, retain) NSString * source;
@property (nonatomic, retain) ComputerSystem *computerSystemID;

@end
