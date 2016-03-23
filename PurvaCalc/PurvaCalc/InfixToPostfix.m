//
//  InfixToPostfix.m
//  PurvaFractionalCalc
//
//  Created by Purva Chakarvarti on 10/25/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import "InfixToPostfix.h"

@interface InfixToPostfix ()
- (NSArray*) object: (NSString*) expression;

- (BOOL) precedenceOf : (NSString*) operator isHigherOrEqualThan: (NSString*) otherOperator;

- (NSUInteger) precedenceOf: (NSString*) operator;

- (void) addNumber:(NSMutableString*) num andNum:(unichar) token toNum : (NSMutableArray*) tokens;

@end

@implementation InfixToPostfix

- (InfixToPostfix*) init{
    self = [super init];
    
    return self;
}

- (NSString*)parseToInfix: (NSString*)infixExpression
{

    
    SimpleStack * s = [[SimpleStack alloc] init];
    NSMutableString * output = [NSMutableString stringWithCapacity:[infixExpression length]];
    
    [s print];
    
    NSArray * tokens = [self object: infixExpression];
    for (NSString *token in tokens){
        if ([self precedenceOf:token] != 0){
 
    NSString *oper = [s peek];
    
    while ( oper && [self precedenceOf:oper] != 0 && [self precedenceOf: oper isHigherOrEqualThan: token]) {
                [output appendString: [NSString stringWithFormat: @"%@ ", [s pop]]];
        
                oper = [s peek];
            }
            // then push the operator on the stack
            [s push:token];
            
            [s print];
            
        }
       else {
           
            [output appendString: [NSString stringWithFormat: @"%@ ", token]];
        }
        
        [s print];
        
    }
    
    while (! [s empty])
    {
        [output appendString: [NSString stringWithFormat: @"%@ ", [s pop]]];
    }
    
    
    return [output stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}



- (NSArray*) object: (NSString*) expression {
    NSMutableArray * tokens = [NSMutableArray arrayWithCapacity:[expression length]];
    
    unichar c;
    NSMutableString * num = [NSMutableString stringWithCapacity: 5];
    int length = [expression length];
    BOOL nextMinusSignIsNegativeOperator = YES;
    
    for (int i = 0; i< length; i++){
        c = [expression characterAtIndex: i];
        switch (c) {
            case '+':
            case '/':
            case 'x':
            case '-':
                if (nextMinusSignIsNegativeOperator){
                    nextMinusSignIsNegativeOperator = NO;
                    [num appendString : [NSString stringWithCharacters: &c length:1]];
                } else {
                    nextMinusSignIsNegativeOperator = YES;
                    [self addNumber: num andNum: c toNum:tokens];
                }
                
                break;
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
            case '0':
                nextMinusSignIsNegativeOperator = NO;
                [num appendString : [NSString stringWithCharacters: &c length:1]];
                break;
            case ' ':
                break;
            default:
                NSLog(@"Unsupported character in input expression : %c, discarding.", c);
                break;
        }
    }
    if ([num length] > 0)
        [tokens addObject:  [NSString stringWithString: num]];
    
    return tokens;
}

- (void) addNumber:(NSMutableString*) num andNum:(unichar) token toNum : (NSMutableArray*) tokens{
    if ([num length] > 0){
        [tokens addObject:  [NSString stringWithString: num]];
        [num setString:@""];
    }
    [tokens addObject: [NSString stringWithCharacters: &token length:1]];			
}


- (BOOL) precedenceOf: (NSString*) operator isHigherOrEqualThan: (NSString*) otherOperator{
    return  [self precedenceOf: operator]  >=  [self precedenceOf: otherOperator];
}

- (NSUInteger) precedenceOf: (NSString*) operator{
    if ([operator compare: @"+"] == 0 )
        return 1;
    else if ([operator compare: @"-"] == 0 )
        return 1;
    else if ([operator compare: @"x"] == 0 )
        return 2;
    else if ([operator compare: @"/"] == 0 )
        return 2;		
    else //invalid operator
        return 0;
}



@end
