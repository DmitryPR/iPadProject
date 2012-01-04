//
//  AudioSystem.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 04.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AudioSystemParameteres, ComputerSystem;

@interface AudioSystem : NSManagedObject

@property (nonatomic, retain) NSNumber * audioSystemID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * sourceType;
@property (nonatomic, retain) ComputerSystem *computerSystemID;
@property (nonatomic, retain) NSSet *audioSystemParametersID;
@end

@interface AudioSystem (CoreDataGeneratedAccessors)

- (void)addAudioSystemParametersIDObject:(AudioSystemParameteres *)value;
- (void)removeAudioSystemParametersIDObject:(AudioSystemParameteres *)value;
- (void)addAudioSystemParametersID:(NSSet *)values;
- (void)removeAudioSystemParametersID:(NSSet *)values;

@end
