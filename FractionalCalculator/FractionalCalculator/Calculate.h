//
//  Calculate.h
//  FractionalCalculator
//
//  Created by Purva Chakravarti on 11/08/15.
//  Copyright (c) 2015 Purva Chakravarti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
#import "SimpleStack.h"
@interface Calculate : NSObject
@property SimpleStack *operands;
@property SimpleStack *operators;
@property SimpleStack *postfixNotaion;


-(NSMutableArray*)convertToPostfix:(NSMutableArray*)infix;
-(BOOL)checkPriority:(NSString*)o1 secondOp:(NSString*)o2;
-(int)getPriority:(NSString*)operator;
-(Fraction*)calculateAns;

@end
