//
//  URLListViewController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/15/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URLListViewController : UIViewController
{
    NSString *location_id;
    IBOutlet UIWebView *webview;
}
@property(nonatomic,retain) NSString *location_id;
@property(nonatomic,retain) IBOutlet UIWebView *webview;
@end
