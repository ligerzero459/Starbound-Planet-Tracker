//
//  Character.m
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import "Character.h"
#import "System.h"


@implementation Character

@dynamic name;
@dynamic index;
@dynamic system;

- (NSString *)description
{
    NSMutableString *temp = [NSMutableString stringWithFormat:@"Name: %@, Index: %@, Systems: [", [self name], [self index]];
    for(System *sys in [[self system] allObjects])
    {
        [temp appendFormat:@"%@, ", [sys description]];
    }
    
    [temp appendString:@"(nil)]"];
    
    return temp;
}

@end
