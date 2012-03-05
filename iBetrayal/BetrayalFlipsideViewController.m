//
//  BetrayalFlipsideViewController.m
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import "BetrayalFlipsideViewController.h"
#import "BetrayalAppDelegate.h"

#import "Settings.h"

@interface BetrayalFlipsideViewController( Private )
-( void )setPickerToCharacterByName:( NSString* )name;
@end

@implementation BetrayalFlipsideViewController

@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-( void )dealloc
{
    [ _characterPicker release ];
    _characterPicker = nil;
    [ super dealloc ];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [ self setPickerToCharacterByName:[ [ self.delegate currentCharacter ] name ] ];
    
    if ( _sleepSwitch && [ UIApplication sharedApplication ] )
    {
        _sleepSwitch.on = [ UIApplication sharedApplication ].idleTimerDisabled;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    BetrayalAppDelegate* appDelegate = ( BetrayalAppDelegate* )[ [ UIApplication sharedApplication ] delegate ];
    [ self.delegate setCurrentCharacter:[ appDelegate getCharacterByName:[ self selectedCharacterName ] ] ];
    
    [self.delegate flipsideViewControllerDidFinish:self];
}

-(void)touchesBegan:( NSSet* )touches withEvent:( UIEvent* )event
{
    for ( UITouch* touch in touches ) 
    {
        if ( [ touch view ] == _adorkableLabel )
        {
            MFMailComposeViewController *picker = [ [ MFMailComposeViewController alloc ] init];
            picker.mailComposeDelegate = self;
            [ picker setToRecipients:[ NSArray arrayWithObject:FEEDBACK_EMAIL ] ];
            [ picker setSubject:FEEDBACK_SUBJECT ];
            
            [self presentModalViewController:picker animated:YES];
            [picker release];
            break;
        }
    }
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [ self dismissModalViewControllerAnimated:YES ];
}

#pragma mark - Character

-( void )setPickerToCharacterByName:( NSString* )name
{
    for( int trav = 0; trav < [ self pickerView:_characterPicker numberOfRowsInComponent:0 ]; trav ++ )
    {
        if ( [ [ self pickerView:_characterPicker titleForRow:trav forComponent:0 ] isEqualToString:name ] )
        {
            [ _characterPicker selectRow:trav inComponent:0 animated:NO ];
            break;
        }
    }
}

-( NSInteger )numberOfComponentsInPickerView:( UIPickerView* )pickerView;
{
    return 1;
}

-( void )pickerView:( UIPickerView* )pickerView didSelectRow:( NSInteger )row inComponent:( NSInteger )component
{
    //    mlabel.text=    [arrayNo objectAtIndex:row];
}

-( NSInteger )pickerView:( UIPickerView* )pickerView numberOfRowsInComponent:( NSInteger )component;
{
    BetrayalAppDelegate* appDelegate = ( BetrayalAppDelegate* )[ [ UIApplication sharedApplication ] delegate ];
    return [ appDelegate numberOfCharacters ];
}

-( NSString* )pickerView:( UIPickerView* )pickerView titleForRow:( NSInteger )row forComponent:( NSInteger )component;
{
    BetrayalAppDelegate* appDelegate = ( BetrayalAppDelegate* )[ [ UIApplication sharedApplication ] delegate ];
    return [ [ appDelegate getCharacterAtIndex:row ] name ];
}

-( NSString* )selectedCharacterName
{
    NSInteger row = [ _characterPicker selectedRowInComponent:0 ];
    return [ self pickerView:_characterPicker titleForRow:row forComponent:0 ];    
}

-( IBAction )toggleSleep:( id )control
{
    if( [ [ control class ] isSubclassOfClass:[ UISwitch class ] ] )
    {
        UISwitch* sleepSwitch = ( UISwitch* )control;
        if ( [ UIApplication sharedApplication ] )
        {
            [ UIApplication sharedApplication ].idleTimerDisabled = [ sleepSwitch isOn ];
        }
    }
}


@end
