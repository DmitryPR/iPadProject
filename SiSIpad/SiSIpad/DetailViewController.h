//
//  DetailViewController.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 04.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>



@property (nonatomic, strong) NSNumber *signalID;
@property (weak, nonatomic) IBOutlet UISegmentedControl *channelIdSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sliderIdSegmentedControl;
@property (weak, nonatomic) IBOutlet UISlider *volumeLevelSlider;
@property (weak, nonatomic) IBOutlet UIButton *generateButton;
@property (weak, nonatomic) IBOutlet UITextField *signalIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *sourceTextField;

@property (weak, nonatomic) IBOutlet UITextField *channelIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *sliderIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *volumeLevelTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sourceSegmentedControl;
- (IBAction)generateTheSignal:(id)sender;
@end
