//
//  LocationDetails.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/3/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "LocationDetails.h"

@implementation LocationDetails
@synthesize location_id,location_Name,location_History,uid;
@synthesize location_picture,longitude,latitude,type;
@synthesize title,description,recommended_location;


-(id)initWithCourseData:(NSInteger)pk location_id:(NSString *)l_id
{
    
	if(self = [super init])
	{
		uid  = pk;
		location_id = [l_id copy];
	}
	
	return self;
}

-(NSString*)getID
{
    return self.location_id;
}

-(NSString*)getName
{
	return self.location_Name;
}

-(NSString*)getHistory
{
	return self.location_History;
}
-(NSString*)getPicture
{
	return self.location_picture;
}
-(NSString*)getLongitude
{
	return self.longitude;
}
-(NSString*)getLatitude
{
	return self.latitude;
}
-(NSString*)getType
{
	return self.type;
}
-(NSString*)getTitle
{
	return self.title;
}
-(NSString*)getDescription
{
	return self.description;
}
-(NSString*)getRecommendedLocation
{
	return self.recommended_location;
}

@end
