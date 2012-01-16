//
//  BetrayalAppDelegate.m
//  iBetrayal
//
//  Created by Ian Grossberg on 1/15/12.
//  Copyright (c) 2012 Adorkable. All rights reserved.
//

#import "BetrayalAppDelegate.h"

#import "BetrayalMainViewController.h"

#import "Character.h"

@interface BetrayalAppDelegate( Private )
-( void )readCharacters;
@end

@implementation BetrayalAppDelegate

@synthesize window = _window;
@synthesize mainViewController = _mainViewController;

- (void)dealloc
{
    [_window release];
    [_mainViewController release];

    [ _characters release ];
    _characters = nil;
    
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.mainViewController = [[[BetrayalMainViewController alloc] initWithNibName:@"BetrayalMainViewController_iPhone" bundle:nil] autorelease];
    } else {
        self.mainViewController = [[[BetrayalMainViewController alloc] initWithNibName:@"BetrayalMainViewController_iPad" bundle:nil] autorelease];
    }
    self.window.rootViewController = self.mainViewController;
    
    [ self readCharacters ];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark - Characters

-( void )readCharacters
{
    _characters = [ [ NSMutableArray alloc ] init ];
    NSDictionary* charactersConfig = [ NSDictionary dictionaryWithContentsOfFile:[ [ NSBundle mainBundle ] pathForResource:@"Characters" ofType:@"plist" ] ];
    NSArray* names = [ charactersConfig allKeys ];
    for ( id name in names ) 
    {
        NSDictionary* characterConfig = ( NSDictionary* )[ charactersConfig objectForKey:name ];
        Character* add = [ [ [ Character alloc ] initWithConfig:name config:characterConfig ] autorelease ];
        [ _characters addObject:add ];
    }
}

-( int )numberOfCharacters
{
    return [ _characters count ];
}

-( Character* )getCharacterAtIndex:( int )index
{
    if ( index >= 0 && index < [ _characters count ] )
        return [ _characters objectAtIndex:index ];
    
    return nil;
}

-( Character* )getCharacterByName:( NSString* )name
{
    for( Character* character in _characters )
    {
        if ( [ [ character name ] isEqualToString:name ] )
            return character;
    }
    
    return nil;
}

-( NSMutableArray* )characters
{
    return _characters;
}

@end
