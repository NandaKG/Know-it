//
//  VideoViewController.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "VideoViewController.h"

@implementation VideoViewController
@synthesize webView;
@synthesize location_id;
@synthesize locationDB;


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
    NSString *url = [NSString stringWithFormat:@"http://pba.cs.clemson.edu/~ngundap/VideosList.php?loc_id=%@",location_id];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    
    [webView addSubview:activityind];
    
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0)
             
                                             target:self
             
                                           selector:@selector(loading)
             
                                           userInfo:nil
             
                                            repeats:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)loading {  
    
    if (!webView.loading)
        
        [activityind stopAnimating];
    
    else
        
        [activityind startAnimating];
    
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
