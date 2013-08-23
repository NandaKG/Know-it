//
//  LocationDetailsController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface LocationDetailsController : UIViewController

{
    IBOutlet UIScrollView *scroller;
    IBOutlet UILabel *name;
    IBOutlet UITextView *history;
    NSString *loc_id;
    IBOutlet UIImageView *picture;
    IBOutlet UIImageView *background;
    NSString *location_id;
    NSMutableArray *locationDB;
    sqlite3 *database;
    NSMutableArray *locationDetailArray;
    

}
@property(nonatomic,retain) IBOutlet UILabel *name;
@property(nonatomic,retain) IBOutlet UITextView *history;
@property(nonatomic,retain) NSString *loc_id;
@property(nonatomic,retain) IBOutlet UIImageView *picture;
@property(nonatomic,retain) NSMutableArray *locationDB;
@property(nonatomic,retain) NSString *location_id; 
@property(nonatomic,retain) NSMutableArray *locationDetailArray;
@property(nonatomic,retain) IBOutlet UIScrollView *scroller;
@property(nonatomic,retain) IBOutlet UIImageView *background;
-(IBAction)ViewMoreTapped:(id)sender;
-(IBAction)OtherAttractionsTapped:(id)sender;
-(IBAction)VideoButtonTapped:(id)sender;
-(IBAction)URLButtonTapped:(id)sender;
-(void)getLocationID;
-(void)doParse;
-(void)scanned;
-(void)insertLocationID;

@end
