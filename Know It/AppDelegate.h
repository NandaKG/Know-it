//
//  AppDelegate.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    sqlite3 *database;
    NSMutableArray *locationDB;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSMutableArray *locationDB;

-(void)createDatabaseIfNeeded;


@end
