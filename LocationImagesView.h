//
//  LocationImagesView.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationImagesView : UIView
{
	IBOutlet UIImageView *imageView;
	IBOutlet UILabel *imageTltle;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UILabel *imageTltle;


@end
