//
//  MasterViewController.m
//  SiSIpad
//
//  Created by Dmitry Preobrazhenskiy on 04.01.12.
//  Copyright (c) 2012 TTU. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Signal.h"
#import "Operator+Create.h"
#import "AudioSystem+Create.h"
#import "OperatorParameters.h"
#import "AudioSystemParameteres.h"
#import "ComputerSystem+Create.h"
#import "Message.h"



@interface MasterViewController() <DetailViewControllerDelegate, ComputerSystemViewControllerDelegate>

@end

@implementation MasterViewController



@synthesize signalDatabase = _signalDatabase;
@synthesize detailViewController = _detailViewController;
@synthesize computerSystemViewController = _computerSystemViewController;




-(void)fetchSignalDataIntoDocument:(UIManagedDocument*)document {
        Signal *signal= nil;
//    
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Signal"];
//    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"signalID" ascending:YES];
//    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
//    
//    NSError *error = nil;
//    NSArray *matches = [self.signalDatabase.managedObjectContext executeFetchRequest:request error:&error];
//    
//    if (!matches || ([matches count] > 1)) {
//        // handle error
//    } else if ([matches count] == 0) {
         Message *message = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.signalDatabase.managedObjectContext];
    
    
        signal = [NSEntityDescription insertNewObjectForEntityForName:@"Signal" inManagedObjectContext:self.signalDatabase.managedObjectContext];
        
        signal.channelID = [NSNumber numberWithInt:self.detailViewController.channelIdSegmentedControl.selectedSegmentIndex +1];
        signal.sliderID = [NSNumber numberWithInt:self.detailViewController.sliderIdSegmentedControl.selectedSegmentIndex +1];
        signal.volumeLevel= [NSNumber numberWithInt:self.detailViewController.volumeLevelSlider.value];
        
     
      
        
        
        if (self.detailViewController.sourceSegmentedControl.selectedSegmentIndex == 0) {
            signal.source = [NSString stringWithString:@"Operator"];
            AudioSystemParameteres *audioSystemParameters = [NSEntityDescription insertNewObjectForEntityForName:@"AudioSystemParameteres" inManagedObjectContext:document.managedObjectContext];
            
            audioSystemParameters.channelID = [NSNumber numberWithInt:self.detailViewController.channelIdSegmentedControl.selectedSegmentIndex +1];
            audioSystemParameters.sliderID = [NSNumber numberWithInt:self.detailViewController.sliderIdSegmentedControl.selectedSegmentIndex +1];
            audioSystemParameters.volumeLevel= [NSNumber numberWithInt:self.detailViewController.volumeLevelSlider.value];
            audioSystemParameters.audioSystemParametersID = [NSNumber numberWithInt:arc4random() % 100000];
            message.source = [NSString stringWithString:@"Operator"];
            message.value = [NSString stringWithString:@"Operator has sucessfully generated the signal"];
            message.messageID = [NSNumber numberWithInt:arc4random() % 1000];
            message.computerSystemID = [ComputerSystem computerSystemWithID:[NSNumber numberWithInt:1] inManagedObjectContext:self.signalDatabase.managedObjectContext];
        }
        
        else {
            signal.source = [NSString stringWithString:@"AudioSystem"];
            OperatorParameters *operatorParameteres = [NSEntityDescription insertNewObjectForEntityForName:@"OperatorParameters" inManagedObjectContext:document.managedObjectContext];
            
            operatorParameteres.channelID = [NSNumber numberWithInt:self.detailViewController.channelIdSegmentedControl.selectedSegmentIndex +1];
            operatorParameteres.sliderID = [NSNumber numberWithInt:self.detailViewController.sliderIdSegmentedControl.selectedSegmentIndex +1];
            operatorParameteres.volumeLevel= [NSNumber numberWithInt:self.detailViewController.volumeLevelSlider.value];
            operatorParameteres.operatorParametersID = [NSNumber numberWithInt:arc4random() % 100000];
            message.source = [NSString stringWithString:@"AudioSystem"];
            message.value = [NSString stringWithString:@"AudioSystem has sucessfully generated the signal"];
            message.messageID = [NSNumber numberWithInt:arc4random() % 1000];
            message.computerSystemID = [ComputerSystem computerSystemWithID:[NSNumber numberWithInt:1] inManagedObjectContext:self.signalDatabase.managedObjectContext];
        }
        signal.signalID = [NSNumber numberWithInt:arc4random() % 1000];
        signal.computerSystemID = [ComputerSystem computerSystemWithID:[NSNumber numberWithInt:1] inManagedObjectContext:document.managedObjectContext];  
        
        NSLog(@"Signal is sent");
    

    [document saveToURL:document.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
}



- (void)setupFetchedResultsController // attaches an NSFetchRequest to this UITableViewController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Signal"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"signalID" ascending:NO]];       
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.signalDatabase.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.signalDatabase) {  // for demo purposes, we'll create a default database if none is set
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        url = [url URLByAppendingPathComponent:@"Default Signal Database"];
        // url is now "<Documents Directory>/Default Photo Database"
        self.signalDatabase = [[UIManagedDocument alloc] initWithFileURL:url]; // setter will create this for us on disk
    }
}

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}


- (void)useDocument
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.signalDatabase.fileURL path]]) {
        // does not exist on disk, so create it
        [self.signalDatabase saveToURL:self.signalDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            [self setupFetchedResultsController];
            [self fetchSignalDataIntoDocument:self.signalDatabase];
            
            
        }];
    } else if (self.signalDatabase.documentState == UIDocumentStateClosed) {
        // exists on disk, but we need to open it
        [self.signalDatabase openWithCompletionHandler:^(BOOL success) {
            [self setupFetchedResultsController];
        }];
    } else if (self.signalDatabase.documentState == UIDocumentStateNormal) {
        // already open and ready to use
        [self setupFetchedResultsController];
    }
}

// 2. Make the photoDatabase's setter start using it

- (void)setSignalDatabase:(UIManagedDocument *)signalDatabase
{
    if (_signalDatabase != signalDatabase) {
        _signalDatabase = signalDatabase;
        [self useDocument];
    }
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    [self.detailViewController setDelegate:self];
    [self.computerSystemViewController setDelegate:self];
   
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Signal Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Signal *signal = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithString:[signal.signalID stringValue]];
//    cell.textLabel.text = [NSString stringWithFormat:@"%d", signal.signalID];
    cell.detailTextLabel.text = signal.source;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Signal *signal = [self.fetchedResultsController objectAtIndexPath:indexPath];
    self.detailViewController.signalIdTextField.text = [NSString stringWithFormat:@"%d",[signal.signalID intValue]];
    self.detailViewController.sourceTextField.text = [NSString stringWithString:signal.source];
    self.detailViewController.channelIdTextField.text = [NSString stringWithFormat:@"%d", [signal.channelID intValue]];
    self.detailViewController.sliderIdTextField.text = [NSString stringWithFormat:@"%d", [signal.sliderID intValue]];
    self.detailViewController.volumeLevelTextField.text = [NSString stringWithFormat:@"%d",[signal.volumeLevel intValue]];
}

-(void)detailViewControllerDidGenerateSignal:(DetailViewController *)sender {
    NSLog(@"Signal Generate Button Pressed");
    [self fetchSignalDataIntoDocument:self.signalDatabase];   
}

-(void)detailViewControllerDidAddOperatorAndAudioSystem:(DetailViewController *)sender {
    
    Message *message = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.signalDatabase.managedObjectContext];
    
    
    NSLog (@"Adding the guys"); 
    Operator *operator = [Operator operatorWithName:self.detailViewController.operatorTextField.text withID:[NSNumber numberWithInt:arc4random() % 10] sourceType:@"OSC" inManagedObjectContext: self.signalDatabase.managedObjectContext]; 
    
    operator.computerSystemID = [ComputerSystem computerSystemWithID:[NSNumber numberWithInt:1] inManagedObjectContext:self.signalDatabase.managedObjectContext];
    
    message.source = [NSString stringWithString:@"Operator"];
    message.value = [NSString stringWithString:@"Operator has been sucessfully added"];
    message.messageID = [NSNumber numberWithInt:arc4random() % 1000];
    message.computerSystemID = [ComputerSystem computerSystemWithID:[NSNumber numberWithInt:1] inManagedObjectContext:self.signalDatabase.managedObjectContext];
   
    
    AudioSystem *audioSystem = [AudioSystem audioSystemWithName:self.detailViewController.audioSystemTextField.text withID:[NSNumber numberWithInt:arc4random() % 10] sourceType:@"MIDI" inManagedObjectContext:self.signalDatabase.managedObjectContext];
    
    audioSystem.computerSystemID = [ComputerSystem computerSystemWithID:[NSNumber numberWithInt:1] inManagedObjectContext:self.signalDatabase.managedObjectContext];
    
    message.source = [NSString stringWithString:@"AudioSystem"];
    message.value = [NSString stringWithString:@"AudioSystem has been sucessfully added"];
    message.messageID = [NSNumber numberWithInt:arc4random() % 1000];
    message.computerSystemID = [ComputerSystem computerSystemWithID:[NSNumber numberWithInt:1] inManagedObjectContext:self.signalDatabase.managedObjectContext];
    
    
    [self.signalDatabase saveToURL:self.signalDatabase.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
    
}

-(void)computerSystemViewControllerDidRequestDatabaseChek:(ComputerSystemViewController *)sender {

    NSLog (@"Entered the DB");
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ComputerSystem"];
    request.predicate = [NSPredicate predicateWithFormat:@"computerSystemID = %d", 1];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"computerSystemID" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSError *error = nil;
    NSArray *computerSystems = [self.signalDatabase.managedObjectContext executeFetchRequest:request error:&error];
    ComputerSystem *computerSystem = [computerSystems lastObject];
    self.computerSystemViewController.numberOfSignalsTextField.text = [NSString stringWithFormat:@"%d", [computerSystem.signalID count]]; 
    self.computerSystemViewController.numberOfOperatorsTextField.text =
    [NSString stringWithFormat:@"%d", [computerSystem.operatorID count]]; 
    self.computerSystemViewController.numberOfMessagesTextField.text = [NSString stringWithFormat:@"%d", [computerSystem.messageID count]]; 
    self.computerSystemViewController.numberOfAudioSystemsTextField.text= [NSString stringWithFormat:@"%d", [computerSystem.audioSystemID count]];
    NSLog (@"Exited the DB");
    
}
-(void)detailViewControllerDidPressTheComputerSystemButton:(DetailViewController *)sender { 
    NSLog (@"Going to check the ComputerSystem");
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ComputerSystem"];
    request.predicate = [NSPredicate predicateWithFormat:@"computerSystemID = %d", 1];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"computerSystemID" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSError *error = nil;
    NSArray *computerSystems = [self.signalDatabase.managedObjectContext executeFetchRequest:request error:&error];
    ComputerSystem *computerSystem = [computerSystems lastObject];
    NSLog(@"We have %d signals", [computerSystem.signalID count]);
    NSLog(@"We have %d operators", [computerSystem.operatorID count]);
    NSLog(@"We have %d audioSystems", [computerSystem.audioSystemID count]);
    NSLog(@"We have %d messages", [computerSystem.messageID count]);
    
}




@end
