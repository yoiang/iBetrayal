//
//  UIStatTrackerViewController.m
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import "UIStatTrackerViewController.h"

#import "Character.h"

@implementation UIStatTrackerViewController

@synthesize _name, _values, _defaultValueIndex;

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ self setStat:self._name values:self._values defaultValueIndex:self._defaultValueIndex ];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Character

-( void )setStat:( NSString* )name values:( NSArray* )values defaultValueIndex:( int )defaultValueIndex
{
    self._name = name;
    self._values = values;
    self._defaultValueIndex = defaultValueIndex;
    
    [ nameView setText:self._name ];
    [ statView setValues:self._values ];
    [ statView setSelectedValueIndex:self._defaultValueIndex ];
}

-( void )setStat:( NSString* )name character:( Character* )character
{
    [ self setStat:name
            values:[ character statValuesByStatName:name ]
 defaultValueIndex:[ [ character statDefaultIndexByStatName:name ] intValue ]
     ];
}

@end
