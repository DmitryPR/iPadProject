//
//  Operator+Create.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 05.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import "Operator.h"

@interface Operator (Create)
+(Operator *)operatorWithName:(NSString *)name withID:(NSNumber*)ID sourceType:(NSString *)source inManagedObjectContext:(NSManagedObjectContext *)context;

@end
