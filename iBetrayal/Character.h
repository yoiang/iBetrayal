//
//  Character.h
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject
{
    NSMutableDictionary* stats;
    
    NSString* name;
    
    UIImage* picture;
    NSString* age;
    NSString* height;
    NSString* weight;
    NSString* hobbies;
    NSString* birthday;    
}

@property ( readonly ) NSString* name;

@property ( readonly ) UIImage* picture;
@property ( readonly ) NSString* age;
@property ( readonly ) NSString* height;
@property ( readonly ) NSString* weight;
@property ( readonly ) NSString* hobbies;
@property ( readonly ) NSString* birthday;

-( NSArray* )statNames;
-( NSArray* )statValuesByStatName:( NSString* )statName;
-( NSNumber* )statDefaultIndexByStatName:( NSString* )statName;

-( id )initWithConfig:( NSString* )setName config:( NSDictionary* )config;
-( id )characterWithConfig:( NSString* )setName config:( NSDictionary* )config;

@end
