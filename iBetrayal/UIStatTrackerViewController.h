//
//  UIStatTrackerViewController.h
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIStatView.h"

@class Character;

@interface UIStatTrackerViewController : UIViewController
{
    IBOutlet id< UIStatView > statView;
    IBOutlet UILabel* nameView;
}

-( void )setStat:( NSString* )name values:( NSArray* )values defaultValueIndex:( int )defaultValueIndex;
-( void )setStat:( NSString* )name character:( Character* )character;

@property ( readwrite, retain ) NSString* _name;
@property ( readwrite, retain ) NSArray* _values;
@property ( readwrite ) int _defaultValueIndex;

@end
