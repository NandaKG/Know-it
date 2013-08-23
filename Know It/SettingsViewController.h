//
//  SettingsViewController.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface SettingsViewController : UIViewController <UIAlertViewDelegate>
{
    sqlite3 *database;
}
- (void)alertOKCancelAction;

-(IBAction)DeleteButtonTapped:(id)sender;
-(void)deleteFunction;
@end
