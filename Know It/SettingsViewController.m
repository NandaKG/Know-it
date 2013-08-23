//
//  SettingsViewController.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

- (void)alertOKCancelAction {
    // open a alert with an OK and cancel button
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WARNING!" message:@"Are you sure you want to delete? It is irreversible?" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"GO BACK", nil];
    [alert show];
}
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons
    if (buttonIndex == 0)
    {
        [self deleteFunction];
         NSLog(@"ok");
    }
    else
    {
        NSLog(@"cancel");
    }
}

-(void)deleteFunction
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentsDirectory stringByAppendingPathComponent:@"RecentLocations.sqlite"];
    NSLog(@"%@",dbPath);
    
    sqlite3_stmt    *statement;
    
    
    if (sqlite3_open([dbPath UTF8String],&database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"Delete from Location_Details"];
        NSLog(@"%@",insertSQL);
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt, 
                           -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            
            NSLog(@"DONE");
            
        } else {
            
            NSLog(@"NOT DONE");    
        }
        sqlite3_finalize(statement);
        sqlite3_close(database);
    }

    
}
-(IBAction)DeleteButtonTapped:(id)sender
{
    [self alertOKCancelAction];

}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
