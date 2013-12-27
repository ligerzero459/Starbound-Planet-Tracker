//
//  Moon.m
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import "Moon.h"
#import "Planet.h"


@implementation Moon

@dynamic biome;
@dynamic threat;
@dynamic index;
@dynamic planet;

- (NSString *)description
{
    NSMutableString *temp = [NSMutableString stringWithFormat:@"[Index: %@, Biome: %@, Threat: %@]", [self index], [self biome], [self threat]];
    
    return temp;
}

@end
