//
//  MoonTableViewController.h
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoonTableViewController : UITableViewController

@property (nonatomic, retain) Moon *selectedMoon;
@property (weak, nonatomic) IBOutlet UITableViewCell *planetCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *biomeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *threatCell;

@end
