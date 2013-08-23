//
//  RecentScansDetailController.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/15/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "RecentScansDetailController.h"
#import "RecentScanMapController.h"

@implementation RecentScansDetailController
@synthesize historyView;
@synthesize name,longitude,latitude,history;
@synthesize locationDB,lonArray,latArray;

-(IBAction)mapButtonTapped:(id)sender
{
    RecentScanMapController *detailViewController = [[RecentScanMapController alloc] initWithNibName:@"RecentScanMapController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    detailViewController.name = name;
    detailViewController.longitude = longitude;
    detailViewController.latitude = latitude;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
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

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"Default@2x.png"]];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

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
