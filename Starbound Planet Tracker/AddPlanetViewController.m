//
//  AddPlanetViewController.m
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import "AddPlanetViewController.h"

@interface AddPlanetViewController ()

@end

@implementation AddPlanetViewController

@synthesize planetNumberTextField, biomeSpinner, threatLevelTextField;
@synthesize selectedSystem;

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
    return [[[DataManager manager] biomes] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[[DataManager manager] biomes] objectAtIndex:row];
}

- (IBAction)cancelButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButtonPressed:(id)sender
{
    Planet *planet = [[DataManager manager] newPlanet];
    [planet setNumber:[NSNumber numberWithInteger:[[planetNumberTextField text] integerValue]]];
    [planet setIndex:[NSNumber numberWithInteger:[[selectedSystem planet] count]]];
    [planet setThreat:[NSNumber numberWithInteger:[[threatLevelTextField text] integerValue]]];
    [planet setBiome:[[[DataManager manager] biomes] objectAtIndex:[biomeSpinner selectedRowInComponent:0]]];
    
    [selectedSystem addPlanetObject:planet];
    
    [[DataManager manager] saveContext];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
