//
//  OptionsViewController.m
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Deselects row
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([indexPath section] == 0 && [indexPath row] == 0)
    {
        UIAlertView *wipeAlert = [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Are you sure you want to wipe your data?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Wipe Data", nil];
        [wipeAlert show];
    }
}

/************************
 Alertview Methods
 ************************/

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Wipe Data"])
    {
        NSArray *characters = [[DataManager manager] getCharacters];
        for (Character *c in characters)
        {
            [[DataManager manager] removeCharacter:c];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
