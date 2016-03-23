//
//  Calculate.m
//  FractionalCalculator
//
//  Created by Purva Chakravarti on 11/08/15.
//  Copyright (c) 2015 Purva Chakravarti. All rights reserved.
//

#import "Calculate.h"
@implementation Calculate
-(id)init
{
    
    self=[super init];
    if(self)
    {
        
        self.operators= [[SimpleStack alloc]init];
        self.operands= [[SimpleStack alloc]init];
        
    }
    
    return self;
    
}
-(SimpleStack*)convertToPostfix:(NSMutableArray*)infix
{
    SimpleStack *postfix = [[SimpleStack alloc]init];
    NSString* temp2 ;
    for(id i in infix)
    {
        if([i isKindOfClass:[Fraction class]])
        {
            NSLog(@"cbvjhasvbcjhasvah");
            [postfix push:i];
            
        }
        
        else{
           

           temp2 = (NSString*)i;
            NSLog(@"%@ ----",temp2);
            if([self.operators size]!=0)
            {
                while(YES)
            
                {
                    if([self.operators size]==0)
                    {
                        break;
                    }
                    NSString* temp1 = [self.operators peek];
                   
                
                    if([self checkPriority:temp2 secondOp:temp1])
                    {
                        
                        [postfix push:temp1];
                        [self.operators pop];
                    
                    }
                    else
                    {
                    
                        break;
                    }
                }
            }
           
            [self.operators push:i];
            NSLog(@"stack operator %lu",(unsigned long)[self.operators size] );

        }
        
        
        
    }
    while(self.operators.size > 0)
    {
        NSLog(@"cemptyng stack");

        [postfix push:[self.operators pop]];
    }
    
    self.postfixNotaion = postfix;
    
    return postfix;
}

-(BOOL)checkPriority:(NSString*)o1 secondOp:(NSString*)o2
{
    
    if([self getPriority:o1]<[self getPriority:o2])
    {
        return YES;
        
    }
    else
    {
        return NO;
    }
    
}

-(int)getPriority:(NSString*)operator
{
    if([operator isEqualToString:@"*"] || [operator isEqualToString:@"/"])
    {
        
        return 10;
    }
    if([operator isEqualToString:@"+"] || [operator isEqualToString:@"-"])
    {
        
        return 5;
    }
    return 0;
    
}

-(Fraction*)calculateAns
{
    Fraction *ans;
    SimpleStack *process = [[SimpleStack alloc]init];
    
       for(id i in self.postfixNotaion.array)
       {
           
           if([i isKindOfClass:[Fraction class]])
           {
               
               [process push:(Fraction*)i];
               
           }
           else
           {
               NSLog(@"checking stack %d" , [process size]);
               
               Fraction *f1 = (Fraction*)[process pop];
               Fraction *f2 = (Fraction*)[process pop];
               NSLog(@"%d/%d %@ %d/%d",f1.numerator,f1.denominator,i,f2.numerator,f2.denominator);
               //[process removeLastObject];
               //[process removeLastObject];
                // do some calculations
               
               if([(NSString*)i isEqualToString:@"+"])
                   ans = [f1 add:f2];
               else if ([(NSString*)i isEqualToString:@"-"])
                    ans = [f2 subtract:f1];
               else if ([(NSString*)i isEqualToString:@"/"])
                   ans = [f2 divide:f1];
               else
                    ans = [f1 multiply:f2];
              
               
               [process push:ans];
               
           }

       }
    return ans;
}

@end
