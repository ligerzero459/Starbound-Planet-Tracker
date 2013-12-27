//
//  AddSystemViewController.h
//  Starbound Planet Tracker
//
//  Created by Ryan Mottley on 12/26/13.
//  Copyright (c) 2013 Kai Strife Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddSystemViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)saveButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *systemTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *sectorSpinner;
@property (weak, nonatomic) IBOutlet UITextField *xcoordTextField;
@property (weak, nonatomic) IBOutlet UITextField *ycoordTextField;

@property (nonatomic, retain) Character *selectedCharacter;

@end
