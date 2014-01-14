//
//  AddMoonViewController.m
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import "AddMoonViewController.h"

@interface AddMoonViewController ()

@end

@implementation AddMoonViewController

@synthesize threatTextField, biomeSpinner;
@synthesize selectedPlanet;

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
    Moon *mun = [[DataManager manager] newMoon];
    [mun setIndex:[NSNumber numberWithInteger:[[selectedPlanet moon] count]]];
    [mun setThreat:[NSNumber numberWithInteger:[[threatTextField text] integerValue]]];
    [mun setBiome:[[[DataManager manager] biomes] objectAtIndex:[biomeSpinner selectedRowInComponent:0]]];
    
    [selectedPlanet addMoonObject:mun];
    
    [[DataManager manager] saveContext];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
