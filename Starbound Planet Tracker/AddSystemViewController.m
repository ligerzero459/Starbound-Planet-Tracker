//
//  AddSystemViewController.m
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import "AddSystemViewController.h"

@interface AddSystemViewController ()

@end

@implementation AddSystemViewController
{
    NSArray *sectors;
}

@synthesize systemTextField, xcoordTextField, ycoordTextField, sectorSpinner;
@synthesize selectedCharacter;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    sectors = [NSArray arrayWithObjects:@"Alpha", @"Beta", @"Gamma", @"Delta", @"X", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [sectors count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [sectors objectAtIndex:row];
}

- (IBAction)cancelButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButtonPressed:(id)sender
{
    System *solarSystem = [[DataManager manager] newSystem];
    [solarSystem setName:[systemTextField text]];
    [solarSystem setSector:[sectors objectAtIndex:[sectorSpinner selectedRowInComponent:0]]];
    [solarSystem setCoordX:[NSNumber numberWithInteger:[[xcoordTextField text] integerValue]]];
    [solarSystem setCoordY:[NSNumber numberWithInteger:[[ycoordTextField text] integerValue]]];
    [solarSystem setIndex:[NSNumber numberWithInt:[[selectedCharacter system] count]]];
    
    [selectedCharacter addSystemObject:solarSystem];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
