//
//  RecentScansViewController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/6/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface RecentScansViewController : UITableViewController
{
    NSString *location_id;
    NSMutableArray *locationDB;
    sqlite3 *database;
    NSMutableArray *locationDetailArray;
    NSString *name;
    NSString *history;
    NSMutableArray *locationIDArray;
    NSMutableArray  *nameArray;
    NSMutableArray *historyArray;
    NSMutableArray *lonArray;
    NSMutableArray *latArray;
    NSMutableArray *lon;
    NSMutableArray *lat;
    NSString *longitude;
    NSString *latitude;

}
@property(nonatomic,retain) NSString *longitude;
@property(nonatomic,retain) NSString *latitude;
@property(nonatomic,retain) NSMutableArray *locationDB;
@property(nonatomic,retain) NSString *location_id; 
@property(nonatomic,retain) NSMutableArray *locationDetailArray;
@property(nonatomic,retain) NSString *name;
@property(nonatomic,retain) NSMutableArray *locationIDArray;
@property(nonatomic,retain) NSMutableArray *nameArray;
@property(nonatomic,retain) NSString *history;
@property(nonatomic,retain) NSMutableArray *historyArray;
@property(nonatomic,retain) NSMutableArray *lonArray;
@property(nonatomic,retain)  NSMutableArray *latArray;
@property(nonatomic,retain) NSMutableArray *lon;
@property(nonatomic,retain)  NSMutableArray *lat;
-(void)getLocationDetails;
@end
