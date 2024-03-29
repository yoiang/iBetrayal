//
//  BetrayalAppDelegate.h
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Character;

@class BetrayalMainViewController;
@class BetrayaliPadMainViewController;
@class MFMailComposeViewController;

@interface BetrayalAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableArray* _characters;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BetrayaliPadMainViewController* iPadMainViewController;
@property (strong, nonatomic) BetrayalMainViewController *mainViewController;

-( int )numberOfCharacters;
-( Character* )getCharacterAtIndex:( int )index;
-( Character* )getCharacterByName:( NSString* )name;

+( MFMailComposeViewController* )createFeedbackController;

@end
