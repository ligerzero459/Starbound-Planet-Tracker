//
//  Planet.m
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import "Planet.h"
#import "Moon.h"
#import "System.h"


@implementation Planet

@dynamic biome;
@dynamic number;
@dynamic threat;
@dynamic index;
@dynamic moon;
@dynamic system;

- (NSString *)description
{
    NSMutableString *temp = [NSMutableString stringWithFormat:@"[Number: %@, Biome: %@, Threat: %@, Moons: [", [self number], [self biome], [self threat]];
    for (Moon *m  in [[self moon] allObjects])
    {
        [temp appendFormat:@"%@, ", [m description]];
    }
    
    [temp appendString:@"(nil)]"];
    
    return temp;
}

@end
