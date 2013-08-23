//
//  MoreDetailsViewController.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/5/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "MoreDetailsViewController.h"

@implementation MoreDetailsViewController
@synthesize scrollView;
@synthesize parser;
@synthesize currentAttribute;
@synthesize xmlElementObjects;
@synthesize locImages;
@synthesize location_id;
@synthesize locationDB;
@synthesize activityind;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	if(![elementName compare:@"Location"])
	{
		locImages = [[LocationImages alloc] init];
	}
	
	else if(![elementName compare:@"location_picture"])
	{
		currentAttribute = [NSMutableString string];
	}
	
	else if(![elementName compare:@"title"])
	{
		currentAttribute = [NSMutableString string];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if(![elementName compare:@"Location"])
	{
		[xmlElementObjects addObject:locImages];
	}
	
	else if(![elementName compare:@"location_picture"])
	{
		NSURL *imageURL = [NSURL URLWithString:currentAttribute];
		NSData *data = [NSData dataWithContentsOfURL:imageURL];
		UIImage *image = [[UIImage alloc] initWithData:data];
		
		[locImages setImage:image];
	} 
	
	else if(![elementName compare:@"title"])
	{
		
		[locImages setImageTitle:currentAttribute];
	}
	
	else if(![elementName compare:@"Locations"])
	{
		[self layoutScrollView];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if(self.currentAttribute)
	{
		[self.currentAttribute appendString:string];
 	}
}

-(void)layoutScrollView
{
	CGRect workingFrame;
	
	workingFrame.origin.x = 0;
	workingFrame.origin.y = 0;
	workingFrame.size.width = 320;
	workingFrame.size.height = 480;
	
	LocationImagesView *myView;
	
	for(LocationImages *element in [self xmlElementObjects])
	{
		myView = [[LocationImagesView alloc] initWithFrame:workingFrame];
		
		NSLog(@"Element title is: %@", [element imageTitle]);
		
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LocationImagesView" owner:nil options:nil];
		
		for(id currentObject in topLevelObjects)
		{
			if([currentObject isKindOfClass:[LocationImagesView class]])
			{
				myView = (LocationImagesView *)currentObject;
			}
		}		
		
		[[myView imageView] setImage:[element image]];
		[[myView imageTltle] setText:[element imageTitle]];
		[myView setFrame:workingFrame];
		
		[scrollView addSubview:myView];
		
		workingFrame.origin.x = workingFrame.origin.x + 320; 
	}
	
	workingFrame.size.width = workingFrame.origin.x;
	[scrollView setContentSize:workingFrame.size];
	
	workingFrame.origin.x = 0;
	workingFrame.origin.y = 0;
	workingFrame.size.width = 320;
	workingFrame.size.height = 520;
	
	[scrollView setFrame:workingFrame];
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

- (void)viewWillAppear:(BOOL)animated
{
    
    xmlElementObjects = [[NSMutableArray alloc] init];
	NSString *path = [NSString stringWithFormat:@"http://pba.cs.clemson.edu/~ngundap/Media_services.php?l_id=%@",location_id];
	parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:path]];
	[parser setDelegate:self];
	[parser parse];
    [super viewWillAppear:animated];
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
