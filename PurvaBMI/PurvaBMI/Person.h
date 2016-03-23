//
//  Person.h
//  PurvaBMI
//
//  Created by Purva Chakarvarti on 9/20/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#ifndef Person_h
#define Person_h

#import <Foundation/Foundation.h>

@interface Person: NSObject
@property (retain, nonatomic)NSNumber* weight;
@property (retain, nonatomic)NSNumber* height;


//class method declaration
+(Person*) sharedPerson;

//method declaration
-(void)inchToCm_lbsToKg;
-(void)cmToInch_KgTolbs;

@end
#endif /* Person_h */
