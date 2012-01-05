//
//  DetailViewController.m
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 04.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"
#import "Operator.h"
#import "AudioSystem.h"
#import "ComputerSystemViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (nonatomic, strong) MasterViewController *masterViewController;

@end

@implementation DetailViewController
@synthesize channelIdSegmentedControl = _channelIdSegmentedControl;
@synthesize sliderIdSegmentedControl = _sliderIdSegmentedControl;
@synthesize volumeLevelSlider = _volumeLevelSlider;
@synthesize generateButton = _generateButton;
@synthesize signalIdTextField = _signalIdTextField;
@synthesize sourceTextField = _sourceTextField;
@synthesize channelIdTextField = _channelIdTextField;
@synthesize sliderIdTextField = _sliderIdTextField;
@synthesize volumeLevelTextField = _volumeLevelTextField;
@synthesize sourceSegmentedControl = _sourceSegmentedControl;
@synthesize audioSystemTextField = _audioSystemTextField;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize signalID = _signalID;
@synthesize masterViewController = _masterViewController;
@synthesize delegate = _delegate;
@synthesize operatorTextField = _operatorTextField;
@synthesize numberOfOperatorsTextField = _numberOfOperatorsTextField;
@synthesize numberOfMessagesTextField = _numberOfMessagesTextField;
@synthesize numberOfAudioSystemsTextField = _numberOfAudioSystemsTextField;
@synthesize numberOfSignalsTextField = _numberOfSignalsTextField;
@synthesize computerSystemIDTextField = _computerSystemIDTextField;

#pragma mark - Managing the detail item

- (void)setSignalID:(NSNumber *)signalID {
    
    if (_signalID != signalID) {
        _signalID = signalID;
        // Update the view.
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}





#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //Doing some configuration here:
    
  
}

- (void)viewDidUnload
{
    [self setChannelIdSegmentedControl:nil];
    [self setSliderIdSegmentedControl:nil];
    [self setVolumeLevelSlider:nil];
    [self setGenerateButton:nil];
    [self setSignalIdTextField:nil];
    [self setSourceTextField:nil];
    [self setChannelIdTextField:nil];
    [self setSliderIdTextField:nil];
    [self setVolumeLevelTextField:nil];
    [self setSourceSegmentedControl:nil];
    [self setOperatorTextField:nil];
    [self setAudioSystemTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}


- (IBAction)addOperatorAndAudioSystem {
    [self.delegate detailViewControllerDidAddOperatorAndAudioSystem:self];
}

- (IBAction)checkTheComputerSystemPressed {
    [self.delegate detailViewControllerDidPressTheComputerSystemButton:self];
}

- (IBAction)generateTheSignal {
    [self.delegate detailViewControllerDidGenerateSignal:self];
}


@end
