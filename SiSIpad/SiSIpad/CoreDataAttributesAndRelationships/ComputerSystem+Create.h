//
//  ComputerSystem+Create.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 05.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import "ComputerSystem.h"

@interface ComputerSystem (Create)
+ (ComputerSystem *)computerSystemWithID:(NSNumber *)ID
                inManagedObjectContext:(NSManagedObjectContext *)context;

@end
