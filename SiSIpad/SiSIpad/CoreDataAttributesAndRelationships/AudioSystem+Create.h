//
//  AudioSystem+Create.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 05.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import "AudioSystem.h"

@interface AudioSystem (Create)
+(AudioSystem *)audioSystemWithName:(NSString *)name withID:(NSNumber*)ID sourceType:(NSString *)source inManagedObjectContext:(NSManagedObjectContext *)context;
@end
