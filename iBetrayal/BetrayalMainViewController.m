//
//  BetrayalMainViewController.m
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import "BetrayalMainViewController.h"
#import "BetrayalAppDelegate.h"

#import "UIStatTrackerViewController.h"
#import "Character.h"

@implementation BetrayalMainViewController

@synthesize flipsidePopoverController = _flipsidePopoverController;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    BetrayalAppDelegate* appDelegate = ( BetrayalAppDelegate* )[ [ UIApplication sharedApplication ] delegate ];
    self.currentCharacter = [ appDelegate getCharacterAtIndex:0 ];
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
    return NO;
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(BetrayalFlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissModalViewControllerAnimated:YES];
    } else {
        [ [ controller view ] removeFromSuperview ];
        [ controller release ];
    }
}

- (void)dealloc
{
    [_flipsidePopoverController release];
    [super dealloc];
}

- (IBAction)showInfo:(id)sender
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        BetrayalFlipsideViewController *controller = [ [ [ BetrayalFlipsideViewController alloc] initWithNibName:@"BetrayaliPhoneFlipsideViewController" bundle:nil ] autorelease ];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:controller animated:YES];
    } else {
        BetrayalFlipsideViewController *controller = [ [ [ BetrayalFlipsideViewController alloc] initWithNibName:@"BetrayaliPadFlipsideViewController" bundle:nil ] autorelease ];
        controller.delegate = self;
        [ controller retain ];
        [ [ self view ] addSubview:[ controller view ] ];
    }
}

#pragma mark - Character

-( void )setCurrentCharacter:( Character* )character
{
    if ( !character )
        return;
    
    [ name setText:[ character name ] ];
    [ picture setImage:[ character picture ] ];
    [ age setText:[ character age ] ];
    [ height setText:[ character height ] ];
    [ weight setText:[ character weight ] ];
    [ birthday setText:[ character birthday ] ];
    [ hobbies setText:[ character hobbies ] ];
    //[ hobbies sizeToFit ];
    
    [ speed setStat:@"Speed" character:character ];
    [ might setStat:@"Might" character:character ];
    [ sanity setStat:@"Sanity" character:character ];
    [ knowledge setStat:@"Knowledge" character:character ];
}


-( Character* )currentCharacter
{
    BetrayalAppDelegate* appDelegate = ( BetrayalAppDelegate* )[ [ UIApplication sharedApplication ] delegate ];
    return [ appDelegate getCharacterByName:[ name text ] ];
}

@end
