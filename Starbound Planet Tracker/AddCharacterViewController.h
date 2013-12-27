//
//  AddCharacterViewController.h
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCharacterViewController : UITableViewController

- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)saveButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *characterTextField;

@end
