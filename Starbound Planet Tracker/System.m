//
//  System.m
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import "System.h"
#import "Character.h"
#import "Planet.h"


@implementation System

@dynamic coordX;
@dynamic coordY;
@dynamic name;
@dynamic sector;
@dynamic index;
@dynamic planet;
@dynamic character;

- (NSString *)description
{
    NSMutableString *temp = [NSMutableString stringWithFormat:@"[Sector: %@, Name: %@, Index: %@, Coords: %@, %@, Planets: [", [self sector], [self name], [self index], [self coordX], [self coordY]];
    for (Planet *p  in [[self planet] allObjects])
    {
        [temp appendFormat:@"%@, ", [p description]];
    }
    
    [temp appendString:@"(nil)]"];
    
    return temp;
}

@end
