//
//  Singleton.m
//  HeightMeasuringByCam
//
//  Created by Purva Chakarvarti on 12/1/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import "Singleton.h"
static  Singleton* _sValue;

@implementation Singleton

@synthesize height;

@synthesize angle1;
@synthesize angle2;
@synthesize pitch;
@synthesize gravityZ;
@synthesize gravityValue;

+(Singleton *)sharedValue
{
    if(_sValue != nil) {
        
        return _sValue;
        
        
    } else {
        
        _sValue=[[Singleton alloc]init];
        return _sValue;
    }
    
}
-(void)cmToM
{
    self.height = ([NSNumber numberWithFloat:([self.height floatValue]/100)]);
}
-(void)mToCm
{
        self.height = ([NSNumber numberWithFloat:([self.height floatValue]*100)]);
}

@end
