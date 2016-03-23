//
//  Singleton.h
//  HeightMeasuringByCam
//
//  Created by Purva Chakarvarti on 12/1/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property (retain,nonatomic)NSNumber *height;
@property (retain, nonatomic)NSNumber *angle1;
@property (retain, nonatomic)NSNumber *angle2;
@property (retain, nonatomic)NSNumber *gravityValue;
@property(retain,nonatomic)id pitch;
@property(retain,nonatomic)id gravityZ;

+(Singleton *)sharedValue;

-(void)cmToM;
-(void)mToCm;

@end
