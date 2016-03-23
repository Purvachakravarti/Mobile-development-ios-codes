//
//  SimpleStack.m
//  PurvaFractionalCalc
//
//  Created by Purva Chakravarti on 11/19/15.
//  Copyright (c) 2015 Purva Chakravarti. All rights reserved.
//

#import "SimpleStack.h"

@implementation SimpleStack

@synthesize array;

- (SimpleStack*) init
{
    self = [super init];
    if (self){
        array = [[NSMutableArray alloc]initWithCapacity:50];
    }
    return self;
}


- (void) push:(id) object
{
    [array addObject:object ];
}

- (id) pop
{
    if ([array count ] < 1)
        return nil;
    
    id item = [array lastObject];
    [array removeLastObject];
    return item;
}

- (int) size
{
    return [array count];
}

- (void) print
{
    NSLog(@"[ %@ ]", [array componentsJoinedByString: @" , "]);
}

- (BOOL) empty
{
    return [array count] == 0;
}

- (id) peek{
    if ([array count] < 1)
        return nil;
    
    return [array lastObject];
}

@end

