//
//  UIStatSegmentedView.m
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import "UIStatSegmentedView.h"

@implementation UIStatSegmentedView

@synthesize values, selectedValueIndex;

-( void )setValues:( NSArray* )setValues
{
    values = setValues;
    [ self removeAllSegments ];
    // TODO: remove all non NSNumber values, making sure _value equates to UISegmented values
    
    UIImage* skullImage = [ UIImage imageWithContentsOfFile:[ [ NSBundle mainBundle ] pathForResource:@"Skull" ofType:@"png" ] ];
    [ self insertSegmentWithImage:[ UIImage imageWithCGImage:[ skullImage CGImage ] scale:7 orientation:UIImageOrientationUp ] atIndex:0 animated:NO ];
    
    for( NSNumber* value in values )
    {
        [ self insertSegmentWithTitle:( NSString* )value atIndex:[ self numberOfSegments ] animated:NO ];
    }    

}

-( void )setSelectedValueIndex:( int )index
{
    if ( index >= 0 && index < self.numberOfSegments )
    {
        self.selectedSegmentIndex = index;
    }
}

@end
