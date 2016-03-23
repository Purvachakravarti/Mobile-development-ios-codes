//
//  Person.m
//  PurvaBMI
//
//  Created by Purva Chakarvarti on 9/20/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
//creating a static instance of the singleton class
static  Person* _sPerson;
@implementation Person
@synthesize weight;
@synthesize height;
+(Person *)sharedPerson
{
    if(_sPerson != nil) {
        
        return _sPerson;
        
    } else {
     
        _sPerson=[[Person alloc]init];
        return _sPerson;
    }
    
}
//method implementation:inchToCm_lbsToKg
-(void)inchToCm_lbsToKg
{
    double dweight= [self.weight doubleValue];
    double dheight = [self.height doubleValue];
    
    
    dheight = dheight*2.54;
    dweight=dweight*0.453592;
    
    self.height = [NSNumber numberWithDouble:dheight];
    self.weight = [NSNumber numberWithDouble:dweight];
    
}
//method implementation:cmToInch_KgTolbs
-(void)cmToInch_KgTolbs
{
    double dweight= [self.weight doubleValue];
    double dheight = [self.height doubleValue];
    
    dheight=dheight/2.54;
    dweight=dweight/0.453592;
    
    self.weight= [NSNumber numberWithDouble:dweight];
    self.height= [NSNumber numberWithDouble:dheight];
}

@end
