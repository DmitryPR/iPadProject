//
//  ComputerSystemViewController.h
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 05.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ComputerSystemViewController;

@protocol ComputerSystemViewControllerDelegate 

@optional
-(void)computerSystemViewControllerDidRequestDatabaseChek:(ComputerSystemViewController *)sender;

@end

@interface ComputerSystemViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *numberOfOperatorsTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfMessagesTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfAudioSystemsTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfSignalsTextField;
@property (weak, nonatomic) IBOutlet UITextField *computerSystemIDTextField;
@property (nonatomic, weak) id <ComputerSystemViewControllerDelegate> delegate;


- (IBAction)checkTheDatabase;
@end
