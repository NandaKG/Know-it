//
//  LocationDetailsController.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "LocationDetailsController.h"
#import "XMLParser.h"
#import "LocationDetails.h"
#import "MoreDetailsViewController.h"
#import "VideoViewController.h"
#import "LocationRecommendedViewController.h"
#import "URLListViewController.h"

@implementation LocationDetailsController
@synthesize name,history;
@synthesize loc_id,picture;
@synthesize location_id,locationDB;
@synthesize locationDetailArray,scroller,background;


-(IBAction)URLButtonTapped:(id)sender
{
    URLListViewController *detailViewController = [[URLListViewController alloc] initWithNibName:@"URLListViewController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    detailViewController.location_id = loc_id;
    [self.navigationController pushViewController:detailViewController animated:YES];
}
-(IBAction)VideoButtonTapped:(id)sender
{
    VideoViewController *detailViewController = [[VideoViewController alloc] initWithNibName:@"VideoViewController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
   detailViewController.location_id = loc_id;
    [self.navigationController pushViewController:detailViewController animated:YES];
}
-(IBAction)ViewMoreTapped:(id)sender
{
    MoreDetailsViewController *detailViewController = [[MoreDetailsViewController alloc] initWithNibName:@"MoreDetailsViewController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
     detailViewController.location_id = loc_id;
    [self insertLocationID];
    [self.navigationController pushViewController:detailViewController animated:YES];
}
-(IBAction)OtherAttractionsTapped:(id)sender
{
    LocationRecommendedViewController *detailViewController = [[LocationRecommendedViewController alloc] initWithNibName:@"LocationRecommendedViewController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    detailViewController.location_id = loc_id;
    [self.navigationController pushViewController:detailViewController animated:YES];
   }

-(void)insertLocationID
{
    if([loc_id length] > 0)
    {
        locationDB = [[NSMutableArray alloc] init];
        
        //Get the database and connect to it.
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *dbPath = [documentsDirectory stringByAppendingPathComponent:@"RecentLocations.sqlite"];
        
        sqlite3_stmt    *statement;
        
        
        if (sqlite3_open([dbPath UTF8String],&database) == SQLITE_OK)
        {
            NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO RecentLocation(Location_ID) VALUES (\"%@\")",loc_id];
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
    else
    {
        NSLog(@" SCAN AGAIN!");
    }
    
    
}

-(void)doParse
{
	[locationDetailArray removeAllObjects];
	//NEED TO GET XML DOCUMENT INTO NSData OBJECT!!
	NSURL *theURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://pba.cs.clemson.edu/~ngundap/Locations_Services.php?l_id=%@",loc_id]];
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


-(void)getLocationID
{
    self.locationDB = [[NSMutableArray alloc] init];
    
	//Get the database and connect to it.
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *dbPath = [documentsDirectory stringByAppendingPathComponent:@"RecentLocations.sqlite"];
	NSLog(@"%@",dbPath);
	//open the database
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK)
	{
        NSString *selectSQL = [NSString stringWithFormat:@"SELECT max(rowid),Location_ID FROM RecentLocation"];
        //NSLog(@"%@",selectSQL);
        const char *select_stmt = [selectSQL UTF8String];
        
        sqlite3_stmt *selectStatement;
        
		//prepare the select statement
		int returnValue = sqlite3_prepare_v2(database,select_stmt, -1, &selectStatement, NULL);
		if(returnValue == SQLITE_OK)
		{
			//loop all the rows returned by the query.
			while(sqlite3_step(selectStatement) == SQLITE_ROW)
			{
				//Get the primary key and the Course name.
				//int key = sqlite3_column_int(selectStatement, 0);
				loc_id = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)];
            }
		}
        
		sqlite3_finalize(selectStatement);
    }	
	else
		sqlite3_close(database);
    
    
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
    //[self insertLocationID];
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"Default@2x.png"]];
    [scroller setScrollEnabled:YES];
	[scroller setContentSize:CGSizeMake(320,500)];
    self.title = @"DETAILS";
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
