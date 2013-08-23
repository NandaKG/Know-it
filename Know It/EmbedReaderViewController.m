//
//  EmbedReaderViewController.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "EmbedReaderViewController.h"
#import "XMLParser.h"
#import "LocationDetails.h"
#import "LocationDetailsController.h"
#import "AppDelegate.h"


@implementation EmbedReaderViewController

@synthesize readerView, resultText,locationDetailArray,loc_id,name;
@synthesize history,path,locationDB;
@synthesize longitude,latitude;

- (void) cleanup
{
    cameraSim = nil;
    readerView.readerDelegate = nil;

    readerView = nil;

    resultText.text = @"";
}
-(void)insertMapDetails
{
    locationDB = [[NSMutableArray alloc] init];
    
    //Get the database and connect to it.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentsDirectory stringByAppendingPathComponent:@"RecentLocations.sqlite"];
    NSLog(@"%@",dbPath);
    
    sqlite3_stmt    *statement;
    
    
    if (sqlite3_open([dbPath UTF8String],&database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO Location_Details(location_id,Name,History,longitude,latitude) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",loc_id,name,history,longitude,latitude];
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
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SORRY" message:@"QR CODE NOT MATCHING"
                                                       delegate:self cancelButtonTitle:@"GO BACK" otherButtonTitles:nil];
        [alert show];

		NSLog(@"fail");
	}
	
}
-(void)scanned
{
    [self doParse];

}


- (void) viewDidLoad
{
    self.title = @"SCANNER";
    
    [super viewDidLoad];

    // the delegate receives decode results
    readerView.readerDelegate = self;

    // you can use this to support the simulator
    if(TARGET_IPHONE_SIMULATOR) {
        cameraSim = [[ZBarCameraSimulator alloc]
                        initWithViewController: self];
        cameraSim.readerView = readerView;
    }
}

- (void) viewDidUnload
{
    [self cleanup];
    [super viewDidUnload];
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) orient
{
    // auto-rotation is supported
    return(YES);
}

- (void) willRotateToInterfaceOrientation: (UIInterfaceOrientation) orient
                                 duration: (NSTimeInterval) duration
{
    // compensate for view rotation so camera preview is not rotated
    [readerView willRotateToInterfaceOrientation: orient
                                        duration: duration];
}

- (void) viewDidAppear: (BOOL) animated
{
    // run the reader when the view is visible
    [readerView start];
}

- (void) viewWillDisappear: (BOOL) animated
{
    [readerView stop];
}

- (void) readerView: (ZBarReaderView*) view
     didReadSymbols: (ZBarSymbolSet*) syms
          fromImage: (UIImage*) img
{
    // do something useful with results
    for(ZBarSymbol *sym in syms) {
        //sym.data;
        loc_id = sym.data;
        break;
    }
       [self scanned];
    
    if (locationDetailArray.count > 0) {
        NSIndexPath * indexPath;
        name = [[locationDetailArray objectAtIndex:indexPath.row] getName];
        history = [[locationDetailArray objectAtIndex:indexPath.row] getHistory];
        longitude = [[locationDetailArray objectAtIndex:indexPath.row] getLongitude];
        latitude = [[locationDetailArray objectAtIndex:indexPath.row] getLatitude];
        [self insertMapDetails];
    LocationDetailsController *detailViewController = [[LocationDetailsController alloc] initWithNibName:@"LocationDetailsController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];

    detailViewController.name.text = name;
    detailViewController.history.text = history;
    detailViewController.loc_id = loc_id;
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SORRY" message:@"NO DETAILS AVAILABLE"
                                                       delegate:self cancelButtonTitle:@"GO BACK" otherButtonTitles:nil];
        [alert show];

        NSLog(@"QR CODE NOT MATCHING!!");
    }
    
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

@end
