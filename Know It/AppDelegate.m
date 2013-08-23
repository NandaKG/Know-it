//
//  AppDelegate.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize locationDB;


-(void)createDatabaseIfNeeded {
    
	BOOL success;
	NSError *error;
	
	//FileManager - Object allows easy access to the File System.
	NSFileManager *FileManager = [NSFileManager defaultManager];
	
	//Get the complete users document directory path.
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	//Get the first path in the array.
	NSString *documentsDirectory = [paths objectAtIndex:0];
	
	//Create the complete path to the database file.
	NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"RecentLocations.sqlite"];
	
	//Check if the file exists or not.
	success = [FileManager fileExistsAtPath:databasePath];
	
	//If the database is present then quit.
	if(success) return;
	
	//the database does not exists, so we will copy it to the users document directory]
	NSString *dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"RecentLocations.sqlite"];
    
	//Copy the database file to the users document directory.
	success = [FileManager copyItemAtPath:dbPath toPath:databasePath error:&error];
	
	//If the above operation is not a success then display a message.
	//Error message can be seen in the debugger's console window.
	if(!success)
		NSAssert1(0, @"Failed to copy the database. Error: %@.", [error localizedDescription]);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self createDatabaseIfNeeded];
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

@end
