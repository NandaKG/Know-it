//
//  RecentScansDetailController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/15/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface RecentScansDetailController : UIViewController
{
    NSMutableArray *locationDB;
    NSMutableArray *lonArray;
    NSMutableArray *latArray;
    IBOutlet UITextView *historyView;
    NSString *name;
    NSString *history;
    NSString *longitude;
    NSString *latitude;
    sqlite3 *database;
    
}
@property(nonatomic,retain) IBOutlet UITextView *historyView;
@property(nonatomic,retain) NSString *name;
@property(nonatomic,retain) NSString *longitude;
@property(nonatomic,retain) NSString *latitude;
@property(nonatomic,retain) NSString *history;
@property(nonatomic,retain) NSMutableArray *locationDB;
@property(nonatomic,retain) NSMutableArray *lonArray;
@property(nonatomic,retain)  NSMutableArray *latArray;
-(IBAction)mapButtonTapped:(id)sender;
@end
