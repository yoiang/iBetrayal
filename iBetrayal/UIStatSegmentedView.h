//
//  UIStatSegmentedView.h
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIStatView.h"

@interface UIStatSegmentedView : UISegmentedControl< UIStatView >
{
}

@property ( readwrite, assign, nonatomic ) NSArray* values;
@property ( readwrite, nonatomic ) int selectedValueIndex;

@end
