//
//  Operator.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 04.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ComputerSystem, OperatorParameters;

@interface Operator : NSManagedObject

@property (nonatomic, retain) NSNumber * operatorID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * sourceType;
@property (nonatomic, retain) ComputerSystem *computerSystemID;
@property (nonatomic, retain) NSSet *operatorParameteresID;
@end

@interface Operator (CoreDataGeneratedAccessors)

- (void)addOperatorParameteresIDObject:(OperatorParameters *)value;
- (void)removeOperatorParameteresIDObject:(OperatorParameters *)value;
- (void)addOperatorParameteresID:(NSSet *)values;
- (void)removeOperatorParameteresID:(NSSet *)values;

@end
