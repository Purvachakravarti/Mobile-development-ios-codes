//
//  InfixToPostfix.h
//  PurvaCalc
//
//  Created by Purva Chakarvarti on 10/19/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleStack.h"

@interface InfixToPostfix : NSObject
{
    NSDictionary * operatorPrecedence;
}

- (InfixToPostfix*) init;

- (NSString*)parseToInfix: (NSString*) infixExpression;

@end
