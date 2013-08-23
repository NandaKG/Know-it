//
//  LocationRecommendedViewController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface LocationRecommendedViewController : UITableViewController
{
    NSString *location_id;
    NSMutableArray *locationDB;
    sqlite3 *database;
    NSMutableArray *locationDetailArray;
    NSString *name;
    NSString *history;
    NSString *longitude;
    NSString *latitude;
    
    
}
@property(nonatomic,retain) NSMutableArray *locationDB;
@property(nonatomic,retain) NSString *location_id; 
@property(nonatomic,retain) NSMutableArray *locationDetailArray;
@property(nonatomic,retain) NSString *name;
@property(nonatomic,retain) NSString *longitude;
@property(nonatomic,retain) NSString *latitude;
@property(nonatomic,retain) NSString *history;
-(void)doParse;
-(void)scanned;
@end
