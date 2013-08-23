//
//  LocationRecommendedViewController.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "LocationRecommendedViewController.h"
#import "XMLParser.h"
#import "LocationDetails.h"
#import "RecommendedLOcationMapViewController.h"

@implementation LocationRecommendedViewController
@synthesize locationDB,location_id,locationDetailArray;
@synthesize name,longitude,latitude,history;

-(void)doParse
{
	[locationDetailArray removeAllObjects];
	//NEED TO GET XML DOCUMENT INTO NSData OBJECT!!
	NSURL *theURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://pba.cs.clemson.edu/~ngundap/Recommended_Locations.php?l_id=%@",location_id]];
    NSLog(@"%@",theURL);
	// create and init NSXMLParser object
	NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithContentsOfURL:theURL];
	// create and init our delegate
	XMLParser *parser = [[XMLParser alloc] initXMLParser];
	//set delegate
	[nsXmlParser setDelegate:parser];
	//parsing...
	BOOL success = [nsXmlParser parse];
	// test the result
	if (success) {
		NSLog(@"success");
		locationDetailArray = [parser getLocation];
	} else {
		NSLog(@"fail");
	}
	
}
-(void)scanned
{
    [self doParse];
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    [self doParse];
    
        [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *header = @"RECOMMENDED LOCATIONS" ;
    return header;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return locationDetailArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"MyCell"];
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        UIFont *titleFont = [UIFont fontWithName:@"Georgia-Bold" size:18.0];
        [[cell textLabel] setFont:titleFont];

    }
    name = [[locationDetailArray objectAtIndex:indexPath.row] getName];
    longitude = [[locationDetailArray objectAtIndex:indexPath.row] getLongitude];
    latitude = [[locationDetailArray objectAtIndex:indexPath.row] getLatitude];
    // Configure the cell...
    [[cell textLabel] setText:(name == nil || [name length] < 1 ? @"?" : name)];

    return cell;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     RecommendedLOcationMapViewController *detailViewController = [[RecommendedLOcationMapViewController alloc] initWithNibName:@"RecommendedLOcationMapViewController" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    detailViewController.name = [[locationDetailArray objectAtIndex:indexPath.row] getName];;
    detailViewController.longitude = [[locationDetailArray objectAtIndex:indexPath.row] getLongitude];
    detailViewController.latitude = [[locationDetailArray objectAtIndex:indexPath.row] getLatitude];
    
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}

@end
