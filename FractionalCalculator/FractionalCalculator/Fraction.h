//
//  Fraction.h
//  FractionalCalculator
//
//  Created by Purva Chakravarti on 11/08/15.
//  Copyright (c) 2015 Purva Chakravarti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
@property int numerator;
@property int denominator;
@property int minusFlag;


-(Fraction*)add:(Fraction*)op2;
-(Fraction*)subtract:(Fraction*)op2;
-(Fraction*)divide:(Fraction*)op2;
-(Fraction*)multiply:(Fraction*)op2;
-(Fraction*)squareRoot:(Fraction*)op2;
-(NSMutableArray*)findRoot:(int)num;

@end
