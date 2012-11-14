//
//  BetrayaliPadMainViewController.h
//  iBetrayal
//
//  Created by Ian Grossberg on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@class BetrayalMainViewController;

@interface BetrayaliPadMainViewController : UIViewController< MFMailComposeViewControllerDelegate >
{
    IBOutlet UILabel* _adorkableLabel;
    
    IBOutlet BetrayalMainViewController* player1;
    IBOutlet BetrayalMainViewController* player2;
    IBOutlet BetrayalMainViewController* player3;
    IBOutlet BetrayalMainViewController* player4;
    IBOutlet BetrayalMainViewController* player5;
    IBOutlet BetrayalMainViewController* player6;
}

-( void )mailComposeController:( MFMailComposeViewController* )controller didFinishWithResult:( MFMailComposeResult )result error:( NSError* )error;

@end
