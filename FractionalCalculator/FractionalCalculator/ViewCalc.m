//
//  ViewCalc.m
//  FractionalCalculator
//
//  Created by Purva Chakravarti on 11/08/15.
//  Copyright (c) 2015 Purva Chakravarti. All rights reserved.
//

#import "ViewCalc.h"

@implementation ViewCalc

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




- (void)drawRect:(CGRect)rect 
{
    NSLog(@"hurray--%@",self.text);
     NSDictionary *textAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:10.0],
                                      NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self.text  drawAtPoint:CGPointMake(self.x, self.y) withAttributes:textAttributes];
}



@end
