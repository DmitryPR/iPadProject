//
//  AudioSystemParameteres.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 04.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AudioSystem;

@interface AudioSystemParameteres : NSManagedObject

@property (nonatomic, retain) NSNumber * audioSystemParametersID;
@property (nonatomic, retain) NSNumber * sliderID;
@property (nonatomic, retain) NSNumber * channelID;
@property (nonatomic, retain) NSNumber * volumeLevel;
@property (nonatomic, retain) AudioSystem *audioSystemID;

@end
