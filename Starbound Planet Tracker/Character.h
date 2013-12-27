//
//  Character.h
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class System;

@interface Character : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) NSSet *system;
@end

@interface Character (CoreDataGeneratedAccessors)

- (void)addSystemObject:(System *)value;
- (void)removeSystemObject:(System *)value;
- (void)addSystem:(NSSet *)values;
- (void)removeSystem:(NSSet *)values;

@end
