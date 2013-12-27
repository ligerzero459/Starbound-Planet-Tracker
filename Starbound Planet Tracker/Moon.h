//
//  Moon.h
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Planet;

@interface Moon : NSManagedObject

@property (nonatomic, retain) NSString * biome;
@property (nonatomic, retain) NSNumber * threat;
@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) Planet *planet;

@end
