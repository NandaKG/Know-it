//
//  RecommendedLOcationMapViewController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <sqlite3.h>


@interface RecommendedLOcationMapViewController : UIViewController
{
    NSString *location_id;
    NSMutableArray *locationDB;
    sqlite3 *database;
    NSMutableArray *locationDetailArray;
    MKMapView *mapview;
    NSString *longitude;
    NSString *latitude;
    NSString *name;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapview;
@property(nonatomic,retain) NSMutableArray *locationDB;
@property(nonatomic,retain) NSString *location_id; 
@property(nonatomic,retain) NSMutableArray *locationDetailArray;
@property(nonatomic,retain) NSString *longitude;
@property(nonatomic,retain)  NSString *latitude;
@property(nonatomic,retain) NSString *name;

-(IBAction)setMap:(id)sender;
-(IBAction)getlocation;  
@end
