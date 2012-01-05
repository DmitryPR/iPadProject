//
//  Operator+Create.m
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 05.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import "Operator+Create.h"
#import "ComputerSystem+Create.h"

@implementation Operator (Create)
+(Operator *)operatorWithName:(NSString *)name withID:(NSNumber*)ID sourceType:(NSString *)source inManagedObjectContext:(NSManagedObjectContext *)context {
    
    Operator *operator = nil;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Operator"];
    request.predicate = [NSPredicate predicateWithFormat:@"operatorID = %@", ID];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSError *error = nil;
    NSArray *operators = [context executeFetchRequest:request error:&error];
    
    if (![operators count]) {
        operator = [NSEntityDescription insertNewObjectForEntityForName:@"Operator" inManagedObjectContext:context];
        operator.name = [NSString stringWithString:name];
        operator.operatorID = ID;
        operator.sourceType = [NSString stringWithString:source];
        return operator;
    }
    
    else {
        return [operators lastObject];
    }
}
@end

