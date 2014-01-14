//
//  DataManager.m
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import "DataManager.h"

@interface DataManager ()
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end

@implementation DataManager
{
    AppDelegate *appDelegate;
}

@synthesize sectors, biomes;

+ (DataManager *)manager
{
    static DataManager *manager = nil;
    
    if (!manager)
    {
        manager = [[super allocWithZone:nil] init];
    }
    
    return manager;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self manager];
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        appDelegate = [UIApplication sharedApplication].delegate;
        self.managedObjectContext = appDelegate.managedObjectContext;
        
        self.sectors = [NSArray arrayWithObjects:@"Alpha", @"Beta", @"Gamma", @"Delta", @"X", nil];
        self.biomes = [NSArray arrayWithObjects:@"Arid", @"Desert", @"Forest", @"Gas Giant", @"Grasslands", @"Jungle", @"Magma", @"Moon", @"Snow", @"Tentacles", @"Tundra", @"Volcanic", nil];
    }
    
    return self;
}

#pragma mark - Save Data

- (void)saveContext
{
    [appDelegate saveContext];
}

#pragma mark - Data Retrieval

- (NSArray *)getCharacters
{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"index" ascending:YES];
    NSArray *allCharacters = [[appDelegate getData:@"Character"] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    return allCharacters;
}

- (NSArray *)getSystems:(Character *)character
{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"index" ascending:YES];
    NSArray *allSystems = [[character system] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    return allSystems;
}

- (NSArray *)getPlanets:(System *)system
{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES];
    NSArray *allPlanets = [[system planet] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    return allPlanets;
}

- (NSArray *)getMoons:(Planet *)planet
{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"index" ascending:YES];
    NSArray *allMoons = [[planet moon] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    return allMoons;
}

#pragma mark - Object Creation

- (Character *)newCharacter
{
    Character *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.managedObjectContext];
    
    return character;
}

- (System *)newSystem
{
    System *system = [NSEntityDescription insertNewObjectForEntityForName:@"System" inManagedObjectContext:self.managedObjectContext];
    
    return system;
}

- (Planet *)newPlanet
{
    Planet *planet = [NSEntityDescription insertNewObjectForEntityForName:@"Planet" inManagedObjectContext:self.managedObjectContext];
    
    return planet;
}

- (Moon *)newMoon
{
    Moon *moon = [NSEntityDescription insertNewObjectForEntityForName:@"Moon" inManagedObjectContext:self.managedObjectContext];
    
    return moon;
}

#pragma mark - Object Deletion

- (void)removeCharacter:(Character *)character
{
    [self.managedObjectContext deleteObject:character];
    [self saveContext];
}

- (void)removeSystem:(System *)system
{
    [self.managedObjectContext deleteObject:system];
    [self saveContext];
}

- (void)removePlanet:(Planet *)planet
{
    [self.managedObjectContext deleteObject:planet];
    [self saveContext];
}

- (void)removeMoon:(Moon *)moon
{
    [self.managedObjectContext deleteObject:moon];
    [self saveContext];
}

@end
