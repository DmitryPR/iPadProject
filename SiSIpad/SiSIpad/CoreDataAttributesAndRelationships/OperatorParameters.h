//
//  OperatorParameters.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 04.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Operator;

@interface OperatorParameters : NSManagedObject

@property (nonatomic, retain) NSNumber * operatorParametersID;
@property (nonatomic, retain) NSNumber * channelID;
@property (nonatomic, retain) NSNumber * sliderID;
@property (nonatomic, retain) NSNumber * volumeLevel;
@property (nonatomic, retain) Operator *operatorID;

@end
