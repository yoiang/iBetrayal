//
//  BetrayaliPadMainViewController.m
//  iBetrayal
//
//  Created by Ian Grossberg on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BetrayaliPadMainViewController.h"

#import "BetrayalAppDelegate.h"
#import "BetrayalMainViewController.h"

@implementation BetrayaliPadMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

-( BetrayalMainViewController* )getReplacementController:( BetrayalMainViewController* )oldController
                                          characterIndex:( int )characterIndex
                                                    left:( BOOL )left
{
    NSString* nibName;
    if ( left )
    {
        nibName = @"BetrayaliPadLeftCharacterView";
    } else
    {
        nibName = @"BetrayaliPadRightCharacterView";
    }
    BetrayalMainViewController* controller = [ [ [ BetrayalMainViewController alloc ] initWithNibName:nibName bundle:nil ] autorelease ];
    [ [ controller view ] setFrame:[ [ oldController view ] frame ] ];

    BetrayalAppDelegate* appDelegate = ( BetrayalAppDelegate* )[ [ UIApplication sharedApplication ] delegate ];
    [ controller setCurrentCharacter:[ appDelegate getCharacterAtIndex:characterIndex ] ];
    
    [ [ oldController view ] removeFromSuperview ];
    [ oldController removeFromParentViewController ];
    [ oldController release ];
    
    return controller;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    player1 = [ [ self getReplacementController:player1 characterIndex:0 left:YES ] retain ];
    [ [ self view] addSubview:[ player1 view ] ];
    
    player2 = [ [ self getReplacementController:player2 characterIndex:1 left:YES ] retain ];
    [ [ self view] addSubview:[ player2 view ] ];
    
    player3 = [ [ self getReplacementController:player3 characterIndex:2 left:YES ] retain ];
    [ [ self view] addSubview:[ player3 view ] ];
    
    player4 = [ [ self getReplacementController:player4 characterIndex:3 left:NO ] retain ];
    [ [ self view] addSubview:[ player4 view ] ];
    
    player5 = [ [ self getReplacementController:player5 characterIndex:4 left:NO ] retain ];
    [ [ self view] addSubview:[ player5 view ] ];
    
    player6 = [ [ self getReplacementController:player6 characterIndex:5 left:NO ] retain ];
    [ [ self view] addSubview:[ player6 view ] ];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return NO;
}


-(void)touchesBegan:( NSSet* )touches withEvent:( UIEvent* )event
{
    for ( UITouch* touch in touches )
    {
        if ( [ touch view ] == _adorkableLabel )
        {
            MFMailComposeViewController *picker = [ BetrayalAppDelegate createFeedbackController ];
            
            picker.mailComposeDelegate = self;
            [ self presentModalViewController:picker animated:YES ];
            break;
        }
    }
}

-( void )mailComposeController:( MFMailComposeViewController* )controller didFinishWithResult:( MFMailComposeResult )result error:( NSError* )error
{
    [ self dismissModalViewControllerAnimated:YES ];
}

@end
