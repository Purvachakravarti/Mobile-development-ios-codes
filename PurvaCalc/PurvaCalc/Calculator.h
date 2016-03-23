//
//  Calculator.h
//  PurvaCalc
//
//  Created by Purva Chakarvarti on 10/16/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import <Foundation/Foundation.h>
\
#import "SimpleStack.h";

@interface Calculator : NSObject
{
    NSArray* operators;
    SimpleStack* stack;
}

- (Calculator*) init;

- (NSDecimalNumber *) compute:(NSString*) postfixExpression;
@end
