//
//  KnowITMainViewController.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "KnowITMainViewController.h"
#import "EmbedReaderViewController.h"
#import "RecentScansViewController.h"

@implementation KnowITMainViewController

-(IBAction)ScanButtonTapped:(id)sender
{
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    EmbedReaderViewController *detailViewController = [[EmbedReaderViewController alloc] initWithNibName:@"EmbedReaderViewController" bundle:nil];
    [self.navigationController pushViewController:detailViewController animated:YES];

}
-(IBAction)RecentLocationButtonTapped:(id)sender
{
    
    RecentScansViewController *detailViewController = [[RecentScansViewController alloc] initWithNibName:@"RecentScansViewController" bundle:nil];
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
