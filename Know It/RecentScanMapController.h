//
//  RecentScanMapController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/15/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface RecentScanMapController : UIViewController <MKMapViewDelegate>
{
    
MKMapView *mapview;
NSString *longitude;
NSString *latitude;
    NSString *name;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapview;
@property(nonatomic,retain) NSString *longitude;
@property(nonatomic,retain)  NSString *latitude;
@property(nonatomic,retain) NSString *name;
-(IBAction)setMap:(id)sender;
-(IBAction)getlocation;  

@end
