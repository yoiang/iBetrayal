//
//  UIStatView.h
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIStatView <NSObject>

-( void )setValues:( NSArray* )values;
-( void )setSelectedValueIndex:( int )index;

@end
