//
//  System.h
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Character, Planet;

@interface System : NSManagedObject

@property (nonatomic, retain) NSNumber * coordX;
@property (nonatomic, retain) NSNumber * coordY;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * sector;
@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) NSSet *planet;
@property (nonatomic, retain) Character *character;
@end

@interface System (CoreDataGeneratedAccessors)

- (void)addPlanetObject:(Planet *)value;
- (void)removePlanetObject:(Planet *)value;
- (void)addPlanet:(NSSet *)values;
- (void)removePlanet:(NSSet *)values;

@end
