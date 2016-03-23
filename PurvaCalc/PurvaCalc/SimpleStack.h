//
//  SimpleStack.h
//  PurvaCalc
//
//  Created by Purva Chakarvarti on 10/19/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleStack : NSObject
{
    NSMutableArray *array;
}

@property (nonatomic, strong) NSMutableArray *array;

- (SimpleStack*) init;

- (void) push:(id) object;
- (id) pop;
- (int) size;
- (void) print;
- (BOOL) empty;
- (id) peek;

@end
