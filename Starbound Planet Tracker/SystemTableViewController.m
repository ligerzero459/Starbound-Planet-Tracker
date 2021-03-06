//
//  SystemTableViewController.m
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import "SystemTableViewController.h"
#import "PlanetTableViewController.h"
#import "AddSystemViewController.h"

@interface SystemTableViewController ()

@end

@implementation SystemTableViewController
{
    NSArray *allSystems;
}

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
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    allSystems = [[DataManager manager] getSystems:selectedCharacter];
    [[self tableView] reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [allSystems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"commonCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    System *sys = [allSystems objectAtIndex:[indexPath row]];
    
    int totalPlanets = 0;
    
    totalPlanets += [[sys planet] count];
    
    for (Planet *p in [sys planet])
    {
        totalPlanets += [[p moon] count];
    }
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ %@", [sys sector], [sys name]]];
    [[cell detailTextLabel] setText:[NSString stringWithFormat:@"X: %@, Y: %@, Planets: %d", [sys coordX], [sys coordY], totalPlanets]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView beginUpdates];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [[DataManager manager] removeSystem:[allSystems objectAtIndex:[indexPath row]]];
        
        allSystems = [[DataManager manager] getSystems:selectedCharacter];
        
        [tableView endUpdates];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"planetSegue"])
    {
        PlanetTableViewController *ptvc = [segue destinationViewController];
        ptvc.selectedSystem = [allSystems objectAtIndex:[[[self tableView] indexPathForSelectedRow] row]];
    }
    else if ([[segue identifier] isEqualToString:@"addSystem"])
    {
        UINavigationController *nav = [segue destinationViewController];
        AddSystemViewController *asvc = [[nav viewControllers] objectAtIndex:0];
        asvc.selectedCharacter = selectedCharacter;
    }
}


@end
