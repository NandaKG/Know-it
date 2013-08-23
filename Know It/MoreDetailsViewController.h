//
//  MoreDetailsViewController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationImages.h"
#import "LocationImagesView.h"
#import <sqlite3.h>
@interface MoreDetailsViewController : UIViewController
{
    IBOutlet UIScrollView *scrollView;
	
	NSXMLParser *parser;
	NSMutableString *currentAttribute;
	NSMutableArray *xmlElementObjects;
    LocationImages *locImages;
    sqlite3 *database;
    NSMutableArray *locationDB;
    NSString *location_id;
    IBOutlet UIActivityIndicatorView *activityind;
    NSTimer *timer;

}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@property (nonatomic, retain) NSXMLParser *parser;
@property (nonatomic, retain) NSMutableString *currentAttribute;
@property (nonatomic, retain) NSMutableArray *xmlElementObjects;
@property (nonatomic, retain) LocationImages *locImages;
@property (nonatomic, retain) NSMutableArray *locationDB;
@property (nonatomic, retain) NSString *location_id;
@property (nonatomic,retain) IBOutlet UIActivityIndicatorView *activityind;

-(void)layoutScrollView;

@end
