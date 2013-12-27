//
//  Planet.h
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Moon, System;

@interface Planet : NSManagedObject

@property (nonatomic, retain) NSString * biome;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSNumber * threat;
@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) NSSet *moon;
@property (nonatomic, retain) System *system;
@end

@interface Planet (CoreDataGeneratedAccessors)

- (void)addMoonObject:(Moon *)value;
- (void)removeMoonObject:(Moon *)value;
- (void)addMoon:(NSSet *)values;
- (void)removeMoon:(NSSet *)values;

@end
