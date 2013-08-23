//
//  VideoViewController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface VideoViewController : UIViewController
{
    IBOutlet UIWebView *webView;
    NSString *location_id;
    NSMutableArray *locationDB;
    sqlite3 *database;
    IBOutlet UIActivityIndicatorView *activityind;
    
    NSTimer *timer; 
}
@property(nonatomic,retain) IBOutlet UIWebView *webView;
@property(nonatomic,retain) NSString *location_id;
@property(nonatomic,retain) NSMutableArray *locationDB;
@end
