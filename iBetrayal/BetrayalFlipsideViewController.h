//
//  BetrayalFlipsideViewController.h
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@class BetrayalFlipsideViewController;
@class Character;

@protocol BetrayalFlipsideViewControllerDelegate
@property ( readwrite, assign ) Character* currentCharacter;
- (void)flipsideViewControllerDidFinish:(BetrayalFlipsideViewController *)controller;
@end

@interface BetrayalFlipsideViewController : UIViewController< UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate >
{
    IBOutlet UIPickerView* _characterPicker;
    IBOutlet UILabel* _adorkableLabel;
}

@property (assign, nonatomic) IBOutlet id <BetrayalFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;
-( NSString* )selectedCharacterName;

@end
