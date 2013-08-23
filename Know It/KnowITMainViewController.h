//
//  KnowITMainViewController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface KnowITMainViewController : UIViewController<ZBarReaderViewDelegate>
{
}
-(IBAction)ScanButtonTapped:(id)sender;
-(IBAction)RecentLocationButtonTapped:(id)sender;
@end
