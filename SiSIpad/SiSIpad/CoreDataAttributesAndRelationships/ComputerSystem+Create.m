//
//  ComputerSystem+Create.m
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 05.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import "ComputerSystem+Create.h"

@implementation ComputerSystem (Create)
+ (ComputerSystem *)computerSystemWithID:(NSNumber *)ID
                  inManagedObjectContext:(NSManagedObjectContext *)context {
    
    ComputerSystem *computerSystem = nil;
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ComputerSystem"];
    request.predicate = [NSPredicate predicateWithFormat:@"computerSystemID = %@", ID];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"computerSystemID" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSError *error = nil;
    NSArray *computerSystems = [context executeFetchRequest:request error:&error];
    
    if (![computerSystems count]) {
        computerSystem = [NSEntityDescription insertNewObjectForEntityForName:@"ComputerSystem" inManagedObjectContext:context];
        computerSystem.computerSystemID = ID;
        return computerSystem;
    }
    else {
        return [computerSystems lastObject];
    }

    
}

@end
