//
//  ComputerSystemViewController.m
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 05.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import "ComputerSystemViewController.h"
#import "ComputerSystem+Create.h"
#import "MasterViewController.h"

@interface ComputerSystemViewController()
@property (nonatomic, strong) MasterViewController *masterViewController;
@end


@implementation ComputerSystemViewController
@synthesize numberOfOperatorsTextField = _numberOfOperatorsTextField;
@synthesize numberOfMessagesTextField = _numberOfMessagesTextField;
@synthesize numberOfAudioSystemsTextField = _numberOfAudioSystemsTextField;
@synthesize numberOfSignalsTextField = _numberOfSignalsTextField;
@synthesize computerSystemIDTextField = _computerSystemIDTextField;
@synthesize delegate = _delegate;
@synthesize masterViewController = _masterViewController;


#pragma mark - View lifecycle




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}


- (void)viewDidUnload
{
    [self setComputerSystemIDTextField:nil];
    [self setNumberOfOperatorsTextField:nil];
    [self setNumberOfMessagesTextField:nil];
    [self setNumberOfAudioSystemsTextField:nil];
    [self setNumberOfSignalsTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)checkTheDatabase {
    NSLog (@"Doing the check");
    NSLog (@"Entered the DB");
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ComputerSystem"];
    request.predicate = [NSPredicate predicateWithFormat:@"computerSystemID = %d", 1];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"computerSystemID" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSError *error = nil;
    NSArray *computerSystems = [self.masterViewController.signalDatabase.managedObjectContext executeFetchRequest:request error:&error];
    ComputerSystem *computerSystem = [computerSystems lastObject];
    self.computerSystemIDTextField.text = [NSString stringWithString:@"1"];
    self.numberOfSignalsTextField.text = [NSString stringWithFormat:@"%d", [ computerSystem.signalID count]]; 
    self.numberOfOperatorsTextField.text =
    [NSString stringWithFormat:@"%d", [computerSystem.operatorID count]]; 
    self.numberOfMessagesTextField.text = [NSString stringWithFormat:@"%d", [computerSystem.messageID count]]; 
    self.numberOfAudioSystemsTextField.text= [NSString stringWithFormat:@"%d", [computerSystem.audioSystemID count]];
    NSLog (@"Exited the DB");
}
@end
