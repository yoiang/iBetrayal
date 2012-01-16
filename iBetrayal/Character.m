//
//  Character.m
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import "Character.h"

#define valuesKey @"Values"
#define defaultIndexKey @"Default Index"

@interface Character( Private ) 
-( void )releaseProperties;
-( void )set:( NSString* )setName config:( NSDictionary* )config;
-( void )setStat:( NSString* )statName config:( NSDictionary* )statConfig;
-( NSMutableDictionary* )statWithName:( NSString* )statName;
@end

@implementation Character

@synthesize name,
picture,
age, height, weight, hobbies, birthday;

-( id )initWithConfig:( NSString* )setName config:( NSDictionary* )config
{
    self = [ self init ];
    if ( self )
    {
        [ self set:setName config:config ];
    }
    return self;
}

-( void )dealloc
{
    [ self releaseProperties ];
    [ super dealloc ];
}

-( void )releaseProperties
{
    [ name release ];
    name = nil;
    [ picture release ];
    picture = nil;
    [ age release ];
    age = nil;
    [ height release ];
    height = nil;
    [ weight release ];
    weight = nil;
    [ hobbies release ];
    hobbies = nil;
    [ birthday release ];
    birthday = nil;
    [ stats release ];
    stats = nil;
}

-( id )characterWithConfig:( NSString* )setName config:( NSDictionary* )config
{
    return [ [ self initWithConfig:setName config:config ] autorelease ];
}

// TODO: missing key handling
-( void )set:( NSString* )setName config:( NSDictionary* )config
{
    [ self releaseProperties ];
    
    name = [ [ NSString alloc ] initWithString:setName ];
    age = [ [ NSString alloc ] initWithString:[ config objectForKey:@"Age" ] ];
    height = [ [ NSString alloc ] initWithString:[ config objectForKey:@"Height" ] ];
    weight = [ [ NSString alloc ] initWithString:[ config objectForKey:@"Weight" ] ];
    hobbies = [ [ NSString alloc ] initWithString:[ config objectForKey:@"Hobbies" ] ];
    birthday = [ [ NSString alloc ] initWithString:[ config objectForKey:@"Birthday" ] ];
    
    picture = [ [ UIImage alloc ] initWithContentsOfFile:[ [ NSBundle mainBundle ] pathForResource:[ config objectForKey:@"Picture" ] ofType:nil ] ];
    if ( picture == nil )
    {
        picture = [ [ UIImage alloc ] initWithContentsOfFile:[ [ NSBundle mainBundle ] pathForResource:@"UnknownCharacter.png" ofType:nil ] ];        
    }
    
    stats = [ [ NSMutableDictionary alloc ] init ];
    NSDictionary* statsConfig = ( NSDictionary* )[ config objectForKey:@"Stats" ];
    NSArray* statNames = [ statsConfig allKeys ];
    for ( NSString* statName in statNames ) 
    {
        [ self setStat:statName config:[ statsConfig objectForKey:statName ] ];
    }
}

-( void )setStat:( NSString* )statName config:( NSDictionary* )statConfig
{
    NSMutableArray* values = [ NSMutableArray arrayWithArray:( NSArray* )[ statConfig objectForKey:valuesKey ] ];
    NSNumber* defaultIndex = ( NSNumber* )[ statConfig objectForKey:defaultIndexKey ];

    NSMutableDictionary* stat = 
    [ NSMutableDictionary dictionaryWithObjectsAndKeys:
     values,valuesKey,
     defaultIndex,defaultIndexKey, nil ];
    
    [ stats setObject:stat forKey:statName ];
}

-( NSMutableDictionary* )statWithName:( NSString* )statName
{
    return [ stats objectForKey:statName ];
}

-( NSArray* )statNames
{
    return [ stats allKeys ];
}

-( NSArray* )statValuesByStatName:( NSString* )statName
{
    NSDictionary* stat = [ self statWithName:statName ];
    return [ stat objectForKey:valuesKey ];
}

-( NSNumber* )statDefaultIndexByStatName:( NSString* )statName
{
    NSDictionary* stat = [ self statWithName:statName ];
    return [ stat objectForKey:defaultIndexKey ];
}

@end
