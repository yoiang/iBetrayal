//
//  BetrayalMainViewController.h
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import "BetrayalFlipsideViewController.h"
@class UIStatTrackerViewController;
@class Character;

@interface BetrayalMainViewController : UIViewController <BetrayalFlipsideViewControllerDelegate>
{
    IBOutlet UILabel* name;
    IBOutlet UIImageView* picture;
    IBOutlet UILabel* age;
    IBOutlet UILabel* height;
    IBOutlet UILabel* weight;
    IBOutlet UILabel* hobbies;
    IBOutlet UILabel* birthday;

    IBOutlet UIStatTrackerViewController* speed;
    IBOutlet UIStatTrackerViewController* might;
    IBOutlet UIStatTrackerViewController* sanity;
    IBOutlet UIStatTrackerViewController* knowledge;
}

@property (strong, nonatomic) UIPopoverController* flipsidePopoverController;

-( IBAction )showInfo:( id )sender;
@property ( readwrite, assign ) Character* currentCharacter;

@end
