//
//  DataManager.h
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppDelegate.h"
#import "Character.h"
#import "System.h"
#import "Planet.h"
#import "Moon.h"

@interface DataManager : NSObject

+ (DataManager *)manager;

/*
 *  Data retrieval methods
 */

- (NSArray *)getCharacters;
- (NSArray *)getSystems:(Character *)character;
- (NSArray *)getPlanets:(System *)system;
- (NSArray *)getMoons:(Planet *)planet;

/*
 *  Object creation methods
 */

- (Character *)newCharacter;
- (System *)newSystem;
- (Planet *)newPlanet;
- (Moon *)newMoon;

/*
 *  Object deletion methods
 */

- (void)removeCharacter:(Character *)character;
- (void)removeSystem:(System *)system;
- (void)removePlanet:(Planet *)planet;
- (void)removeMoon:(Moon *)moon;

@end
