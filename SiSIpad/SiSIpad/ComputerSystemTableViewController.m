//
//  ComputerSystemTableViewController.m
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 05.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import "ComputerSystemTableViewController.h"
#import "MasterViewController.h"
#import "ComputerSystem+Create.h"

@class ComputerSystemTableViewController;

@interface ComputerSystemTableViewController ()
@property (nonatomic, strong) MasterViewController *masterViewController;
@end

@implementation ComputerSystemTableViewController 



@synthesize computerSystemIDSelected = _computerSystemIDSelected;
@synthesize cell1 = _cell1;
@synthesize cell2 = _cell2;
@synthesize cell3 = _cell3;
@synthesize masterViewController = _masterViewController;

-(void)setComputerSystemIDSelected:(NSNumber *)computerSystemIDSelected{
    if (_computerSystemIDSelected != computerSystemIDSelected) {
        _computerSystemIDSelected = computerSystemIDSelected;
    }
    
}
    

-(void)updateInformation {
  
    
                                 
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self updateInformation];
}



- (void)viewDidUnload
{
    
   
    [self setCell1:nil];
    [self setCell2:nil];
    [self setCell3:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
