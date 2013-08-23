//
//  XMLParser.m
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/3/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import "XMLParser.h"
#import "LocationDetails.h"

@implementation XMLParser
@synthesize personToParse;
@synthesize location;

- (XMLParser *) initXMLParser {
	
	// init array of user objects 
	location = [[NSMutableArray alloc] init];
	return self;
}

- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	if ([elementName isEqualToString:@"Location"]) {
		
		locationToParse = [[LocationDetails alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	if (!currentElementValue) {
		// init the ad hoc string with the value     
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	} else {
		// append value to the ad hoc string    
		[currentElementValue appendString:string];
	}
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
	NSLog(@"Parser error occured %@",parseError);
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
	if ([elementName isEqualToString:@"Locations"]) {
		// We reached the end of the XML document
		return;
	}
	
	if ([elementName isEqualToString:@"Location"]) {
		// We are done with user entry – add the parsed user 
		// object to our user array
		[location addObject:self->locationToParse];
		// release user object
		locationToParse= nil;
	} else {
		// The parser hit one of the element values. 
		// This syntax is possible because User object 
		// property names match the XML user element names  
		[locationToParse setValue:currentElementValue forKey:elementName];
	}
	
	currentElementValue = nil;
}

-(NSMutableArray*)getLocation
{
	return location;
}
// end of XMLParser.m file
@end
