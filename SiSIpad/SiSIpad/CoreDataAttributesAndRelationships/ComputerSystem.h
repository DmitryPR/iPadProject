//
//  ComputerSystem.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 04.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AudioSystem, Message, Operator, Signal;

@interface ComputerSystem : NSManagedObject

@property (nonatomic, retain) NSNumber * computerSystemID;
@property (nonatomic, retain) NSSet *audioSystemID;
@property (nonatomic, retain) NSSet *messageID;
@property (nonatomic, retain) NSSet *signalID;
@property (nonatomic, retain) NSSet *operatorID;
@end

@interface ComputerSystem (CoreDataGeneratedAccessors)

- (void)addAudioSystemIDObject:(AudioSystem *)value;
- (void)removeAudioSystemIDObject:(AudioSystem *)value;
- (void)addAudioSystemID:(NSSet *)values;
- (void)removeAudioSystemID:(NSSet *)values;

- (void)addMessageIDObject:(Message *)value;
- (void)removeMessageIDObject:(Message *)value;
- (void)addMessageID:(NSSet *)values;
- (void)removeMessageID:(NSSet *)values;

- (void)addSignalIDObject:(Signal *)value;
- (void)removeSignalIDObject:(Signal *)value;
- (void)addSignalID:(NSSet *)values;
- (void)removeSignalID:(NSSet *)values;

- (void)addOperatorIDObject:(Operator *)value;
- (void)removeOperatorIDObject:(Operator *)value;
- (void)addOperatorID:(NSSet *)values;
- (void)removeOperatorID:(NSSet *)values;

@end
