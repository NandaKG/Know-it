//
//  LocationImages.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationImages : NSObject
{
	UIImage *image;
	NSString *imageTitle;
}

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSString *imageTitle;

@end
