//
//  XMLParser.h
//  Know It
//
//  Created by Nanda kishore Gundapaneni on 12/3/11.
//  Copyright (c) 2011 Clemson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LocationDetails;

@interface XMLParser : NSObject<NSXMLParserDelegate> {
	// an ad hoc string to hold element value
	NSMutableString *currentElementValue;
	// user object
	LocationDetails *locationToParse;
	// array of user objects
	NSMutableArray *location;
}

@property (nonatomic, retain) LocationDetails *personToParse;
@property (nonatomic, retain) NSMutableArray *location;

-(NSMutableArray*)getLocation;
- (XMLParser *) initXMLParser;
- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict;
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName;
@end
