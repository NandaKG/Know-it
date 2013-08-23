//
//  LocationDetails.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/3/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationDetails : NSObject
{
    NSInteger uid;

    NSString *location_id;
    NSString *location_Name;
    NSString *location_History;
    NSString *location_picture;
    NSString *longitude;
    NSString *latitude;
    NSString *type;
    NSString *title;
    NSString *description;
    NSString *recommended_location;
    
    
}
@property(assign,readonly,nonatomic)NSInteger uid;
@property(nonatomic,copy) NSString *location_id;
@property(nonatomic,retain) NSString *location_Name;
@property(nonatomic,retain) NSString *location_History;
@property(nonatomic,retain) NSString *location_picture;
@property(nonatomic,retain) NSString *longitude;
@property(nonatomic,retain) NSString *latitude;
@property(nonatomic,retain) NSString *type;
@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *description;
@property(nonatomic,retain) NSString *recommended_location;
-(NSString*)getID;
-(NSString*)getName;
-(NSString*)getHistory;
-(NSString*)getLongitude;
-(NSString*)getLatitude;
-(NSString*)getPicture;
-(NSString*)getType;
-(NSString*)getTitle;
-(NSString*)getDescription;
-(NSString*)getRecommendedLocation;

@end
