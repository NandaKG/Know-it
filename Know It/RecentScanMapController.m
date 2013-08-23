//
//  RecentScanMapController.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/15/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "RecentScanMapController.h"
#import "MapViewPins.h"


@implementation RecentScanMapController
@synthesize mapview,longitude,latitude,name;

-(IBAction)getlocation {
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.001, 0.001);
    MKCoordinateRegion region = MKCoordinateRegionMake(self.mapview.userLocation.coordinate, span);
    [self.mapview setRegion:region animated:YES];

    
}

-(IBAction)setMap:(id)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            mapview.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapview.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapview.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
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
    mapview.showsUserLocation = YES;
    double longitude_double;
    double latitude_double;
    NSScanner* scanner = [NSScanner scannerWithString:longitude];
    NSScanner* scanner1 = [NSScanner scannerWithString:latitude];
    [scanner scanDouble:&longitude_double];
    [scanner1 scanDouble:&latitude_double];
    NSLog(@"%f",longitude_double);
    NSLog(@"%f",latitude_double);
    [mapview setMapType:MKMapTypeStandard];
    [mapview setZoomEnabled:YES];
    [mapview setScrollEnabled:YES];
    
    MKCoordinateRegion region = { {0.0, 0.0 }, {0.0, 0.0 } };
    region.center.latitude = longitude_double;
    region.center.longitude = latitude_double;
    region.span.longitudeDelta = 0.007f;
    region.span.latitudeDelta = 0.007f;
    [mapview setRegion:region animated:YES];
    
    MapViewPins *ann = [[MapViewPins alloc] init];
    ann.title = name;
    ann.coordinate = region.center;
    [mapview addAnnotation:ann];
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
