//
//  AudioSystem+Create.m
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 05.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import "AudioSystem+Create.h"

@implementation AudioSystem (Create)
+(AudioSystem *)audioSystemWithName:(NSString *)name withID:(NSNumber*)ID sourceType:(NSString *)source inManagedObjectContext:(NSManagedObjectContext *)context {
 
    AudioSystem *audioSystem = nil;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"AudioSystem"];
    request.predicate = [NSPredicate predicateWithFormat:@"audioSystemID = %@", ID];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSError *error = nil;
    NSArray *audioSystems = [context executeFetchRequest:request error:&error];
    
    if (![audioSystems count]) {
        audioSystem = [NSEntityDescription insertNewObjectForEntityForName:@"AudioSystem" inManagedObjectContext:context];
        audioSystem.name = [NSString stringWithString:name];
        audioSystem.audioSystemID = ID;
        audioSystem.sourceType = [NSString stringWithString:source];
        
        return audioSystem;
    }
    
    else {
        return [audioSystems lastObject];
    }
}


@end
