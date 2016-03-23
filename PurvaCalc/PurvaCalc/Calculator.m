//
//  Calculator.m
//  PurvaCalc
//
//  Created by Purva Chakarvarti on 10/16/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import "Calculator.h"
@interface Calculator ()
- (NSDecimalNumber *) computeOperator:(NSString*) operator
                     withFirstOperand:(NSDecimalNumber*) firstOperand withSecondOperand:(NSDecimalNumber*) secondOperand;
@end

@implementation Calculator

- (Calculator*) init{
    self = [super init];
    if (self){
        operators = [NSArray arrayWithObjects: @"+", @"-", @"x", @"/", nil];
        
    }
    
    return self;
}

- (NSDecimalNumber*) compute:(NSString*) postfixExpression{
    stack = [[SimpleStack alloc] init];
    NSString* strippedExpression = [postfixExpression stringByTrimmingCharactersInSet:
                                    [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSArray *tokens = [strippedExpression componentsSeparatedByString: @" "];
    
    for(NSString* token in tokens){
        
        if ([operators containsObject:token]){
           
            NSDecimalNumber* secondOperand = (NSDecimalNumber*) [stack pop];
            NSDecimalNumber* firstOperand= (NSDecimalNumber*) [stack pop];
            
            
            if (! (firstOperand && secondOperand)){
                NSLog(@"Not enough operands on stack for given operator");
                return nil;
            }
            
      
            
            NSDecimalNumber * result =  [self computeOperator:token
                                             withFirstOperand: firstOperand
                                            withSecondOperand:secondOperand];
            
            if (result == [NSDecimalNumber notANumber])
                return result;            [stack push:result];
            
        } else {
            
            NSDecimalNumber * operand = [NSDecimalNumber decimalNumberWithString : token];
            [stack push: operand];
        }
    }
    
    
    if ([stack size] != 1){
        NSLog(@"Error : Invalid RPN expression. Stack contains %d elements after computing expression, only one should remain.",
              [stack size]);
        return nil;
    } else {
        NSDecimalNumber * result = [stack pop] ;
       
        return result;
    }
}



- (NSDecimalNumber *) computeOperator:(NSString*) operator
                     withFirstOperand:(NSDecimalNumber*) firstOperand withSecondOperand:(NSDecimalNumber*) secondOperand{
    NSDecimalNumber * result;
    
    if ([operator compare: @"+"] == 0) {
        result = [firstOperand decimalNumberByAdding: secondOperand];
    }else if ([operator compare: @"x"] == 0) {
        result = [firstOperand decimalNumberByMultiplyingBy: secondOperand];
    } else if ([operator compare: @"-"] == 0) {
        result = [firstOperand decimalNumberBySubtracting: secondOperand];
    } else if ([operator compare: @"/"] == 0) {
        if ([[NSDecimalNumber zero] compare: secondOperand] == NSOrderedSame){
            NSLog(@"Divide by zero !");
            return [NSDecimalNumber notANumber];
        }
        else 
            result = [firstOperand decimalNumberByDividingBy: secondOperand];	}
    
    return result;
}


@end
