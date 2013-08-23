//
//  RecentScansViewController.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/6/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "RecentScansViewController.h"
#import "XMLParser.h"
#import "LocationDetails.h"
#import "RecentScansDetailController.h"


@implementation RecentScansViewController
@synthesize locationDB,location_id,locationDetailArray;
@synthesize name,locationIDArray;
@synthesize nameArray;
@synthesize historyArray,history;
@synthesize lonArray,latArray;
@synthesize longitude,latitude;
@synthesize lon,lat;


-(void)getLocationDetails
{
    self.locationDB = [[NSMutableArray alloc] init];
    self.locationIDArray = [[NSMutableArray alloc] init];
    self.lonArray = [[NSMutableArray alloc] init];
    self.latArray = [[NSMutableArray alloc] init];
	//Get the database and connect to it.
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *dbPath = [documentsDirectory stringByAppendingPathComponent:@"RecentLocations.sqlite"];
	NSLog(@"%@",dbPath);
	
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK)
	{
        NSString *selectSQL = [NSString stringWithFormat:@"SELECT location_id,Name,History,longitude,latitude FROM Location_Details"];
        //NSLog(@"%@",selectSQL);
        const char *select_stmt = [selectSQL UTF8String];
        
        sqlite3_stmt *selectStatement;
        
		//prepare the select statement
		int returnValue = sqlite3_prepare_v2(database,select_stmt, -1, &selectStatement, NULL);
		if(returnValue == SQLITE_OK)
		{
			while(sqlite3_step(selectStatement) == SQLITE_ROW)
			{
				historyArray = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 2)];
				nameArray = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)];
                lon = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 3)];
				lat = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 4)];
                [lonArray addObject:lon];
                [latArray addObject:lat];
                [locationDB addObject:nameArray];
                [locationIDArray addObject:historyArray];
            }
            
            
            
		}
		sqlite3_finalize(selectStatement);
    }	
	else
		sqlite3_close(database);
    
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

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
    [self getLocationDetails];
    self.title = @"Recent Locations";
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return locationDB.count;
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
        
        UIFont *detailFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:14.0];
        [[cell detailTextLabel] setFont:detailFont];
    }

    name = [locationDB objectAtIndex:indexPath.row];
    history = [locationIDArray objectAtIndex:indexPath.row];
    // Configure the cell...
   // cell.text = name;
    [[cell textLabel] setText:(name == nil || [name length] < 1 ? @"?" : name)];
    [[cell detailTextLabel] setText:history];
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
    
     RecentScansDetailController *detailViewController = [[RecentScansDetailController alloc] initWithNibName:@"RecentScansDetailController" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    detailViewController.title = [locationDB objectAtIndex:indexPath.row];
    detailViewController.name = [locationDB objectAtIndex:indexPath.row];
    
     [self.navigationController pushViewController:detailViewController animated:YES];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    detailViewController.historyView.text = [locationIDArray objectAtIndex:indexPath.row];
    detailViewController.longitude = [lonArray objectAtIndex:indexPath.row];
    detailViewController.latitude = [latArray objectAtIndex:indexPath.row];
 
}

@end
