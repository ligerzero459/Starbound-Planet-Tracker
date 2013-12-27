//
//  PlanetDataViewController.m
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import "PlanetDataViewController.h"
#import "MoonTableViewController.h"
#import "AddMoonViewController.h"

@interface PlanetDataViewController ()

@end

@implementation PlanetDataViewController
{
    NSArray *allMoons;
}

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

- (void)viewDidAppear:(BOOL)animated
{
    allMoons = [[DataManager manager] getMoons:selectedPlanet];
    [super viewDidAppear:animated];
    
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
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Planet Number";
    }
    else if (section == 1)
    {
        return @"Biome";
    }
    else if (section == 2)
    {
        return @"Threat Level";
    }
    else
    {
        return @"Orbiting Moons";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3)
    {
        return [allMoons count];
    }
    else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString *numberIdentifier = @"normalCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:numberIdentifier forIndexPath:indexPath];
        
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:numberIdentifier];
        }
        
        [[cell textLabel] setText:[[selectedPlanet number] stringValue]];
        
        return cell;
    }
    else if (indexPath.section == 1)
    {
        static NSString *biomeIdentifier = @"normalCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:biomeIdentifier forIndexPath:indexPath];
        
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:biomeIdentifier];
        }
        
        [[cell textLabel] setText:[selectedPlanet biome]];
        
        return cell;
    }
    else if (indexPath.section == 2)
    {
        static NSString *threatIdentifier = @"normalCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:threatIdentifier forIndexPath:indexPath];
        
        
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:threatIdentifier];
        }
        
        [[cell textLabel] setText:[[selectedPlanet threat] stringValue]];
        
        return cell;
    }
    else
    {
        static NSString *CellIdentifier = @"commonCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        
        Moon *moon = [allMoons objectAtIndex:[indexPath row]];
        
        [[cell textLabel] setText:[moon biome]];
        [[cell detailTextLabel] setText:[NSString stringWithFormat:@"Threat: %@", [[moon threat] stringValue]]];
        
        return cell;
    }
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section == 3)
//    {
//        MoonTableViewController *mtvc = [self.storyboard instantiateViewControllerWithIdentifier:@"moonData"];
//        mtvc.selectedMoon = [allMoons objectAtIndex:[[[self tableView] indexPathForSelectedRow] row]];
//        
//        [self.navigationController pushViewController:mtvc animated:YES];
//    }
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
    if ([[segue identifier] isEqualToString:@"moonDataSegue"])
    {
        MoonTableViewController *mtvc = [segue destinationViewController];
        mtvc.selectedMoon = [allMoons objectAtIndex:[[[self tableView] indexPathForSelectedRow] row]];
    }
    else if ([[segue identifier] isEqualToString:@"addMoon"])
    {
        UINavigationController *nav = [segue destinationViewController];
        AddMoonViewController *amvc = [[nav viewControllers] objectAtIndex:0];
        amvc.selectedPlanet = selectedPlanet;
    }
}
 


@end
