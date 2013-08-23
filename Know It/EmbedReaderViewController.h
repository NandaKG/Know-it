//
//  EmbedReaderViewController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"
#import <sqlite3.h>


@interface EmbedReaderViewController
    : UIViewController
    < ZBarReaderViewDelegate >
{
    ZBarReaderView *readerView;
    UITextView *resultText;
    ZBarCameraSimulator *cameraSim;
    NSMutableArray *locationDetailArray;
    NSString *loc_id;
    NSString *name;
    NSString *history;
    NSString *path;
    NSString *longitude;
    NSString *latitude;
    sqlite3 *database;
    NSMutableArray *locationDB;
}
@property(nonatomic,retain) NSString *longitude;
@property(nonatomic,retain) NSString *latitude;
@property (nonatomic, retain) IBOutlet ZBarReaderView *readerView;
@property (nonatomic, retain) IBOutlet UITextView *resultText;
@property (nonatomic, retain) NSMutableArray *locationDetailArray;
@property (nonatomic,retain)NSString *loc_id;
@property (nonatomic,retain)NSString *name;
@property (nonatomic,retain)NSString *history;
@property (nonatomic,retain)NSString *path;
@property (nonatomic,retain)NSMutableArray *locationDB;
-(void)insertMapDetails;
-(void)insertLocationID;
-(void)doParse;
-(void)scanned;
@end
