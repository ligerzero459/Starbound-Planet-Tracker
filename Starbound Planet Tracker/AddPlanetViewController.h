//
//  AddPlanetViewController.h
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPlanetViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *planetNumberTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *biomeSpinner;
@property (weak, nonatomic) IBOutlet UITextField *threatLevelTextField;

@property (nonatomic, retain) System *selectedSystem;

@end
