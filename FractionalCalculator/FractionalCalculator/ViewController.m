//
//  ViewController.m
//  FractionalCalculator
//
//  Created by Purva Chakravarti on 11/08/15.
//  Copyright (c) 2015 Purva Chakravarti. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end
NSMutableArray *operand;
int change=0;
int denom=0;
Fraction *f ;
NSString *numerator;
int signFlag=0;



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.root setTitle:@"\u221A" forState:UIControlStateNormal];
    [self.labelSep setTitle:@"Separator" forState:UIControlStateNormal];
    [self.negate setTitle:@"\u2213" forState:UIControlStateNormal];
    
    self.labelAC.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelAC.layer.borderWidth = 1.0;
    self.labelOne.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelOne.layer.borderWidth = 1.0;
    self.labelTwo.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelTwo.layer.borderWidth = 1.0;
    self.labelThree.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelThree.layer.borderWidth = 1.0;
    self.labelFour.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelFour.layer.borderWidth = 1.0;
    self.labelFive.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelFive.layer.borderWidth = 1.0;
    self.labelSix.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelSix.layer.borderWidth = 1.0;
    self.labelSeven.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelSeven.layer.borderWidth = 1.0;
    self.labelEight.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelEight.layer.borderWidth = 1.0;
    self.labelNine.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelNine.layer.borderWidth = 1.0;
    self.negate.layer.borderColor = [UIColor blueColor].CGColor;
    self.negate.layer.borderWidth = 1.0;
    self.root.layer.borderColor = [UIColor blueColor].CGColor;
    self.root.layer.borderWidth = 1.0;
    self.labelMul.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelMul.layer.borderWidth = 1.0;
    self.labelDiv.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelDiv.layer.borderWidth = 1.0;
    self.labelAdd.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelAdd.layer.borderWidth = 1.0;
    self.labelSub.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelSub.layer.borderWidth = 1.0;
    self.labelZero.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelZero.layer.borderWidth = 1.0;
    self.labelSep.layer.borderColor = [UIColor blueColor].CGColor;
    self.labelSep.layer.borderWidth = 1.0;
    self.labeAns.layer.borderColor = [UIColor blueColor].CGColor;
    self.labeAns.layer.borderWidth = 1.0;

    operand =[[NSMutableArray alloc]initWithObjects:nil];
    self.screenLabel.layer.borderColor = [UIColor blueColor].CGColor;
    self.screenLabel.layer.borderWidth = 1.0;
    self.a = [[ViewCalc alloc]initWithFrame:CGRectMake(40, 50, 320, 70)];
    self.a.x = 8,
    self.a.y =2;
    self.a.text = @"0";
    self.nexty=2;
    self.nextx=8;
    self.sepx = 8;
    self.sepy = 4+10;
    self.sepflag=0;
    self.startOp=8;
    self.fractions = [[NSMutableArray alloc]initWithObjects:nil];
   [self.view addSubview:self.a];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString*)display
{
    NSMutableString *disText= [[NSMutableString alloc]init];
    for(NSString* i in operand)
    {
        [disText appendString:i];
    }
   
    return disText;
    
    
}


- (IBAction)label9:(id)sender {
    
    [operand addObject:@"9"];
    if(self.sepflag==1)
    {
       
        //self.sepflag=0;
        denom++;
        NSLog(@"denom inc");
        
    }
    else
    {
        change++;
         NSLog(@"change inc");
    }
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text = @"9";
    a.x = 0;
    a.y =0;
    self.nextx+=6;
    
    
    [self.a addSubview:a];
    
}

- (IBAction)multiply:(id)sender {
    f=[[Fraction alloc]init];
    if(denom==0 && change==0)
    {
        f.denominator=1;
        f.numerator=0;
        
    }
    else if(denom==0 && change!=0)
    {
        f.denominator=1;
        [self addsep:change];
        if(signFlag==1)
        {
            
            f.numerator = -[[self display] intValue];
        }
        else
        {
            f.numerator = [[self display] intValue];
        }
        
        
        
    }
    else if (denom!=0 && change==0)
    {
        f.numerator=1;
        if(signFlag==1)
        {
            f.denominator  = - [[self display] intValue];
        }
        else
        {
            f.denominator =  [[self display] intValue];
        }
        
        
    }
    else
    {
        if(signFlag==1)
        {
            f.numerator = -[numerator intValue];
        }
        else
        {
            f.numerator = [numerator intValue];
        }
        
        f.denominator = [[self display] intValue];
    }

    f.minusFlag = signFlag;
    [self.fractions addObject:f];
    [self.fractions addObject:@"*"];

    
   NSLog(@"%d fraction is",[self.fractions count]);
    self.nexty = 10;
    self.sepflag=0;
    if(change>denom)
    {
        NSLog(@"%d %d change and denom",change,denom);
        self.nextx = self.startOp+(change*7);
    }
    else
    {
         NSLog(@"%d %d change and denom",change,denom);
        [self addsep:denom];
         self.nextx = self.startOp+(denom*7);
    }
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text = @"*";
    a.x = 0;
    a.y =0;
    
    [self.a addSubview:a];
    self.nextx+=11;
    self.nexty =2;
    self.startOp = self.nextx;
    self.sepx=self.nextx;
    self.sepy=10+4;
    [operand removeAllObjects];
    
    change=0;
    denom=0;
    signFlag=0;
    numerator=@"";

    
}

- (IBAction)add:(id)sender {
    f = [[Fraction alloc]init];
    if(denom==0 && change==0)
    {
        f.denominator=1;
        f.numerator=0;
        
    }
    else if(denom==0 && change!=0)
    {
        f.denominator=1;
        [self addsep:change];
        if(signFlag==1)
        {
            
            f.numerator = -[[self display] intValue];
        }
        else
        {
            f.numerator = [[self display] intValue];
        }
        
        
        
    }
    else if (denom!=0 && change==0)
    {
        f.numerator=1;
        if(signFlag==1)
        {
            f.denominator  = - [[self display] intValue];
        }
        else
        {
            f.denominator =  [[self display] intValue];
        }
        
        
    }
    else
    {
        if(signFlag==1)
        {
            f.numerator = -[numerator intValue];
        }
        else
        {
            f.numerator = [numerator intValue];
        }
        
        f.denominator = [[self display] intValue];
    }

    [self.fractions addObject:f];
    [self.fractions addObject:@"+"];

     NSLog(@"%d fraction is",[self.fractions count]);
     NSLog(@"%d %d change and denom",change,denom);
    self.nexty = 7;
    self.sepflag=0;

    if(change>denom)
    {
        self.nextx = self.startOp+(change*7);
    }
    else
    {
        [self addsep:denom];
        self.nextx = self.startOp+(denom*7);
    }
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text=@"+";
    //a.text = @"+";
    a.x = 0;
    a.y =0;
    self.nextx+=13;
    self.nexty =2;
    self.startOp = self.nextx;
    self.sepx=self.nextx;
    self.sepy=10+4;
    [operand removeAllObjects];
    
    [self.a addSubview:a];
    change=0;
    denom=0;
      signFlag=0;
    numerator=@"";
   
}

- (IBAction)subtract:(id)sender {
    f = [[Fraction alloc]init];
    if(denom==0 && change==0)
    {
        f.denominator=1;
        f.numerator=0;
        
    }
    else if(denom==0 && change!=0)
    {
        f.denominator=1;
        [self addsep:change];
        if(signFlag==1)
        {
            
            f.numerator = -[[self display] intValue];
        }
        else
        {
            f.numerator = [[self display] intValue];
        }
        
        
        
    }
    else if (denom!=0 && change==0)
    {
        f.numerator=1;
        if(signFlag==1)
        {
            f.denominator  = - [[self display] intValue];
        }
        else
        {
            f.denominator =  [[self display] intValue];
        }
        
        
    }
    else
    {
        if(signFlag==1)
        {
            f.numerator = -[numerator intValue];
        }
        else
        {
            f.numerator = [numerator intValue];
        }
        
        f.denominator = [[self display] intValue];
    }
    f.minusFlag = signFlag;
    [self.fractions addObject:f];
    [self.fractions addObject:@"-"];

    NSLog(@"%d fraction is",[self.fractions count]);

    self.nexty = 7;
    self.sepflag=0;

    if(change>denom)
    {
        self.nextx = self.startOp+(change*7);
    }
    else
    {
        [self addsep:denom];
        self.nextx = self.startOp+(denom*7);
    }
     ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    a.text = @"-";
    a.x = 0;
    a.y =0;
    self.nextx+=11;
    self.nexty =2;
    self.startOp = self.nextx;
    self.sepx=self.nextx;
    self.sepy=10+4;
    [operand removeAllObjects];
    
    [self.a addSubview:a];
    change=0;
    denom=0;
    signFlag=0;
    numerator=@"";
   
}

- (IBAction)allClear:(id)sender {
    [self.fractions removeAllObjects];
    [operand removeAllObjects];
    self.screenLabel.layer.borderColor = [UIColor blueColor].CGColor;
    self.screenLabel.layer.borderWidth = 1.0;
    self.a = [[ViewCalc alloc]initWithFrame:CGRectMake(40, 50, 320, 70)];
    self.a.x = 8,
    self.a.y =2;
    self.a.text = @"0";
    self.nexty=2;
    self.nextx=8;
    self.sepx = 8;
    self.sepy = 4+10;
    self.sepflag=0;
    self.startOp=8;
    signFlag=0;
    denom=0;
    change=0;
   
    [self.minus removeFromSuperview];
    [self.view addSubview:self.a];
}

- (IBAction)negate:(id)sender {
    if(signFlag==0)
    {
        signFlag=1;
        ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.startOp-7,self.sepy-7,7,10)];
        a.text = @"-";
        a.x = 0;
        a.y =0;
        [self.a addSubview:a];
        self.minus = a;

    }
    else{
        
        signFlag=0;
        [self.minus removeFromSuperview];
    }
   
}



- (IBAction)label4:(id)sender {
    
    [operand addObject:@"4"];
    if(self.sepflag==1)
    {
       // self.nexty+= 13;
       // self.sepflag=0;
        denom++;
        
    }
    else
    {
        change++;
    }

    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text = @"4";
    a.x = 0;
    a.y =0;
    self.nextx+=6;
    
    
    [self.a addSubview:a];

}

- (IBAction)label5:(id)sender {
    
    [operand addObject:@"5"];
    if(self.sepflag==1)
    {
        //self.nexty+= 13;
        //self.sepflag=0;
        denom++;
        
    }
    else
    {
        change++;
    }

    
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text = @"5";
    a.x = 0;
    a.y =0;
    self.nextx+=6;
    
    
    [self.a addSubview:a];

}

- (IBAction)label6:(id)sender {
    
    [operand addObject:@"6"];
    if(self.sepflag==1)
    {
        //self.nexty+= 13;
        //self.sepflag=0;
        denom++;
        
    }else
    {
        change++;
    }

    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text = @"6";
    a.x = 0;
    a.y =0;
    self.nextx+=6;
    
    
    [self.a addSubview:a];
}

- (IBAction)label7:(id)sender {
        [operand addObject:@"7"];
    if(self.sepflag==1)
    {
        //self.nexty+= 13;
        //self.sepflag=0;
        denom++;
        
    }
    else
    {
        change++;
    }
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text = @"7";
    a.x = 0;
    a.y =0;
    self.nextx+=6;
    
    
    [self.a addSubview:a];

}

- (IBAction)label8:(id)sender {
    
    [operand addObject:@"8"];
    if(self.sepflag==1)
    {
        //self.nexty+= 13;
        //self.sepflag=0;
        denom++;
    }
    else
    {
        change++;
    }
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text = @"8";
    a.x = 0;
    a.y =0;
    self.nextx+=6;
    
    
    [self.a addSubview:a];
}


- (IBAction)label1:(id)sender {

    [operand addObject:@"1"];
    if(self.sepflag==1)
    {
       // self.nexty+= 13;
        //self.sepflag=0;
        denom++;
        
    }
    else
    {
        change++;
    }
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text = @"1";
    a.x = 0;
    a.y =0;
    self.nextx+=6;
    
    
    [self.a addSubview:a];
}

- (IBAction)label2:(id)sender {
       [operand addObject:@"2"];
    if(self.sepflag==1)
    {
       // self.nexty+= 13;
        //self.sepflag=0;
        denom++;
        
    }
    else
    {
        change++;
    }
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text = @"2";
    a.x = 0;
    a.y =0;
    self.nextx+=6;
    
    
    [self.a addSubview:a];
}

- (IBAction)label3:(id)sender {

    [operand addObject:@"3"];
    if(self.sepflag==1)
    {
        //self.nexty+= 13;
        //self.sepflag=0;
        denom++;
        
    }
    else
    {
        change++;
    }
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text = @"3";
    a.x = 0;
    a.y =0;
    self.nextx+=6;
    
    
    [self.a addSubview:a];

}

- (IBAction)separator:(id)sender {
    
    if(self.sepflag==0)
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        NSLog(@"%f %f sep cord",self.sepx,self.sepy);
        [path moveToPoint:CGPointMake(self.sepx, self.sepy)];
        NSLog(@"%d numbers of operands",[operand count]);
        [path addLineToPoint:CGPointMake(self.sepx+[operand count]*(6.5),self.sepy)];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = [path CGPath];
        shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
        shapeLayer.lineWidth = 1.0;
        shapeLayer.fillColor = [[UIColor clearColor] CGColor];
        [self.a.layer addSublayer:shapeLayer];
        self.sepflag=1;
        self.nexty+= 13;
        self.nextx=self.startOp;
        numerator = [self display];
        [operand removeAllObjects];
       
        
    }
    
}

-(void)addsep:(int)size
{
   
    UIBezierPath *path = [UIBezierPath bezierPath];
    NSLog(@"%f %f sep cord",self.sepx,self.sepy);
    [path moveToPoint:CGPointMake(self.sepx, self.sepy)];
    NSLog(@"%d numbers of operands",[operand count]);
    [path addLineToPoint:CGPointMake(self.sepx+(size*6.5),self.sepy)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
    shapeLayer.lineWidth = 1.0;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    [self.a.layer addSublayer:shapeLayer];

    
}


- (IBAction)divide:(id)sender {
    
    
    f = [[Fraction alloc]init];
    
    if(denom==0 && change==0)
    {
        f.denominator=1;
        f.numerator=0;
        
    }
    else if(denom==0 && change!=0)
    {
        f.denominator=1;
        [self addsep:change];
        if(signFlag==1)
        {
            
            f.numerator = -[[self display] intValue];
        }
        else
        {
            f.numerator = [[self display] intValue];
        }
        
        
        
    }
    else if (denom!=0 && change==0)
    {
        f.numerator=1;
        if(signFlag==1)
        {
             f.denominator  = - [[self display] intValue];
        }
        else
        {
            f.denominator =  [[self display] intValue];
        }
    
        
    }
    else
    {
        if(signFlag==1)
        {
            f.numerator = -[numerator intValue];
        }
        else
        {
            f.numerator = [numerator intValue];
        }
        
        f.denominator = [[self display] intValue];
    }

    f.minusFlag= signFlag;
    [self.fractions addObject:f];
    [self.fractions addObject:@"/"];
    
    NSLog(@"%d fraction is",[self.fractions count]);
    /*
    for(id i in self.fractions)
    {
        if([i isKindOfClass:[Fraction class]] )
        {
            Fraction *temp  = (Fraction*)i;
            NSLog(@"%d / %d", temp.numerator, temp.denominator);
            
        }
        else{
            
            NSString *temp = (NSString*)i;
             NSLog(@"%@", temp);
        }
        
    }
     */
    self.nexty = 10;
    self.sepflag=0;

    if(change>denom)
    {
        self.nextx = self.startOp+(change*7);
    }
    else
    {
        [self addsep:denom];
        self.nextx = self.startOp+(denom*7);
    }
     ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    a.text = @"/";
    a.x = 0;
    a.y =0;
    self.nextx+=11;
    self.nexty =2;
    self.startOp = self.nextx;
    self.sepx=self.nextx;
    self.sepy=10+4;
    [operand removeAllObjects];
    
    [self.a addSubview:a];
    change=0;
    denom=0;
    signFlag=0;
    numerator=@"";
   

}
- (IBAction)label0:(id)sender {
    [operand addObject:@"0"];
    if(self.sepflag==1)
    {
        // self.nexty+= 13;
        // self.sepflag=0;
        denom++;
        
    }
    else
    {
        change++;
    }
    
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(self.nextx,self.nexty,7,10)];
    
    a.text = @"0";
    a.x = 0;
    a.y =0;
    self.nextx+=6;
    
    
    [self.a addSubview:a];

}
- (IBAction)Answer:(id)sender {
   
    f = [[Fraction alloc]init];
    if(denom==0 && change==0)
    {
        f.denominator=1;
        f.numerator=0;
        
    }
    else if(denom==0 && change!=0)
    {
        f.denominator=1;
        [self addsep:change];
        if(signFlag==1)
        {
            
            f.numerator = -[[self display] intValue];
        }
        else
        {
            f.numerator = [[self display] intValue];
        }
        
        
        
    }
    else if (denom!=0 && change==0)
    {
        f.numerator=1;
        if(signFlag==1)
        {
            f.denominator  = - [[self display] intValue];
        }
        else
        {
            f.denominator =  [[self display] intValue];
        }
        
        
    }
    else
    {
        if(signFlag==1)
        {
            f.numerator = -[numerator intValue];
        }
        else
        {
            f.numerator = [numerator intValue];
        }
        
        f.denominator = [[self display] intValue];
    }
    f.minusFlag= signFlag;
    [self.fractions addObject:f];
    if([self checkZero])
    {
        
        return;
    }
    if(change>denom)
    {
        
    }
    else
    {
        NSLog(@"xvxdvxcvxc %d",denom);
        [self addsep:denom];
        
    }
    for(id i in self.fractions)
    {
        if([i isKindOfClass:[Fraction class]] )
        {
            Fraction *temp  = (Fraction*)i;
            NSLog(@"%d / %d", temp.numerator, temp.denominator);
            
        }
        else{
            
            NSString *temp = (NSString*)i;
            NSLog(@"%@", temp);
        }
            }

    NSLog(@"m.m..,.====%d",[self.fractions count]);
   
    Calculate *c = [[Calculate alloc]init];
    c.postfixNotaion = [c convertToPostfix:self.fractions];
    for(id i in c.postfixNotaion.array)
    {
        if([i isKindOfClass:[Fraction class]] )
        {
            Fraction *temp  = (Fraction*)i;
            NSLog(@"%d / %d", temp.numerator, temp.denominator);
            
        }
        else{
            
            NSString *temp = (NSString*)i;
            NSLog(@"%@", temp);
        }
        
    }

    NSLog(@"jeet.====%d",[c.postfixNotaion size]);
    Fraction *ans = [c calculateAns];
   
    
    if([self.fractions count]==1)
    {
        ans = [self.fractions objectAtIndex:0];
    }
    
    if([self.fractions count]==0)
    {
        Fraction *native = [[Fraction alloc]init];
        native.numerator=0;
        native.denominator=1;
        native.minusFlag=0;
        ans = native;
    }
    

    if(abs(ans.numerator)>abs(ans.denominator) && ans.denominator!=1)
    {
        [self displaySimple:ans];
    }
    else
    {
    if(ans.numerator<0)
    {
        
        ans.numerator=-ans.numerator;
        ViewCalc *b = [[ViewCalc alloc]initWithFrame:CGRectMake(195,43,7,10)];
        
        b.text = @"-";
        b.x = 0;
        b.y =0;
        
        [self.a addSubview:b];
        
    }
    if(ans.denominator<0)
    {
        
        ans.denominator=-ans.denominator;
        ViewCalc *b = [[ViewCalc alloc]initWithFrame:CGRectMake(195,43,7,10)];
        
        b.text = @"-";
        b.x = 0;
        b.y =0;
        
        [self.a addSubview:b];
        
    }

    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(200,39,90,10)];
    
    a.text = [NSString stringWithFormat:@"%d",ans.numerator];
    a.x = 0;
    a.y =0;
   
    int numOfnumerator=0;
    int dummy1 =ans.numerator;
    while(YES)
    {
        if((dummy1%10)==dummy1)
        {
            numOfnumerator++;
            break;
            
        }
        numOfnumerator++;
        dummy1=dummy1/10;
        
        NSLog(@"hey dude");
    }
    
    [self.a addSubview:a];
    
    
    ViewCalc *b = [[ViewCalc alloc]initWithFrame:CGRectMake(200,50,90,10)];
    
    b.text = [NSString stringWithFormat:@"%d",ans.denominator];
    b.x = 0;
    b.y =0;
    
    [self.a addSubview:b];
    
    int numOfdenominator=0;
    int dummy2 =ans.denominator;
    while(YES)
    {
        if((dummy2%10)==dummy2)
        {
            numOfdenominator++;
            break;
            
        }
        numOfdenominator++;
        dummy2=dummy2/10;
        
        NSLog(@"hey dude");
        
    }
    if(numOfnumerator>=numOfdenominator)
    {
        [self lastsep:numOfnumerator];
        
    }
    else
    {
         [self lastsep:numOfdenominator];
    }
     NSLog(@"hahahahhahahahahhahahaa  %d %d", numOfnumerator,numOfdenominator);
    
    }
    
}

-(void)giveError:(NSString*)msg
{
    
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(130,39,150,12)];
    
    a.text = msg;
    a.x = 0;
    a.y =0;
    
    [self.a addSubview:a];
    
}
- (IBAction)squareRoot:(id)sender {
    
    f= [[Fraction alloc]init];
    if(denom==0 && change==0)
    {
        f.denominator=1;
        f.numerator=0;
        
    }
    else if(denom==0 && change!=0)
    {
        f.denominator=1;
        [self addsep:change];
        if(signFlag==1)
        {
            
            f.numerator = -[[self display] intValue];
        }
        else
        {
            f.numerator = [[self display] intValue];
        }
        
        
        
    }
    else if (denom!=0 && change==0)
    {
        f.numerator=1;
        if(signFlag==1)
        {
            f.denominator  = - [[self display] intValue];
        }
        else
        {
            f.denominator =  [[self display] intValue];
        }
        
        
    }
    else
    {
        if(signFlag==1)
        {
            f.numerator = -[numerator intValue];
        }
        else
        {
            f.numerator = [numerator intValue];
        }
        
        f.denominator = [[self display] intValue];
    }
    
    f.minusFlag= signFlag;
    [self.fractions addObject:f];
    if([self checkZero])
    {
        
        return;
    }
    if(change>denom)
    {
        
    }
    else
    {
        NSLog(@"xvxdvxcvxc %d",denom);
        [self addsep:denom];
        
    }
    for(id i in self.fractions)
    {
        if([i isKindOfClass:[Fraction class]] )
        {
            Fraction *temp  = (Fraction*)i;
            NSLog(@"%d / %d", temp.numerator, temp.denominator);
            
        }
        else{
            
            NSString *temp = (NSString*)i;
            NSLog(@"%@", temp);
        }
    }
    
    NSLog(@"m.m..,.====%d",[self.fractions count]);
    
    Calculate *c = [[Calculate alloc]init];
    c.postfixNotaion = [c convertToPostfix:self.fractions];
    for(id i in c.postfixNotaion)
    {
        if([i isKindOfClass:[Fraction class]] )
        {
            Fraction *temp  = (Fraction*)i;
            NSLog(@"%d / %d", temp.numerator, temp.denominator);
            
        }
        else{
            
            NSString *temp = (NSString*)i;
            NSLog(@"%@", temp);
        }
        
    }
    
    Fraction *ans = [c calculateAns];
    if([self.fractions count]==1)
    {
        ans = [self.fractions objectAtIndex:0];
    }
    
    if([self.fractions count]==0)
    {
        Fraction *native = [[Fraction alloc]init];
        native.numerator=0;
        native.denominator=1;
        native.minusFlag=0;
        ans = native;
    }
    if((ans.numerator<0 && ans.denominator>0)|| (ans.numerator>0 && ans.denominator<0))
    {
        [self giveError:@"root of Minus Error"];
         NSLog(@"finding roots of %d %d", ans.numerator,ans.denominator);
        return;
        
    }
    int numeratorPartOne,numeratorPartTwo,denominatorPartOne,denominatorPartTwo;
    
        Fraction *r=[[Fraction alloc]init];
        int flag=0;
   
        NSMutableDictionary * ansofRoot = [r squareRoot:ans];
        for(id key in ansofRoot)
        {
            
           
            if(flag==0)
            {
               numeratorPartOne = [[[ansofRoot objectForKey:key] objectAtIndex:0] intValue];
               numeratorPartTwo = [[[ansofRoot objectForKey:key] objectAtIndex:1] intValue];
               flag++;
            }
            else
            {
                denominatorPartOne = [[[ansofRoot objectForKey:key] objectAtIndex:0] intValue];
                denominatorPartTwo =[[[ansofRoot objectForKey:key] objectAtIndex:1] intValue];
                
            }
        }
    
    if(denominatorPartOne == numeratorPartOne)
    {
        denominatorPartOne=1;
        
        numeratorPartOne=1;
    }
    if(denominatorPartTwo== numeratorPartTwo)
    {
        denominatorPartTwo=1;
        
        numeratorPartTwo=1;
      
    }
    
    
    ViewCalc *a = [[ViewCalc alloc]initWithFrame:CGRectMake(200,39,90,12)];
    
    a.text = [NSString stringWithFormat:@"%d\u221A%d",numeratorPartOne,numeratorPartTwo];
    a.x = 0;
    a.y =0;
    
    [self.a addSubview:a];
    
    
    ViewCalc *b = [[ViewCalc alloc]initWithFrame:CGRectMake(200,50,90,12)];
    
    b.text = [NSString stringWithFormat:@"%d\u221A%d",denominatorPartOne,denominatorPartTwo];
    b.x = 0;
    b.y =0;
    
    [self.a addSubview:b];
    
    int l1 = [self countNumbers:numeratorPartOne]+[self countNumbers:numeratorPartTwo]+1;
    int l2 = [self countNumbers:denominatorPartOne]+[self countNumbers:denominatorPartTwo]+1;

    if(l1>l2)
    {
        [self lastsep:l1];
    }
    else
    {
        [self lastsep:l2];
    }
    

}

-(int)countNumbers:(int)number
{
    
    
    int numOfnumerator=0;
    int dummy1 = number;
    while(YES)
    {
        if((dummy1%10)==dummy1)
        {
            numOfnumerator++;
            break;
            
        }
        numOfnumerator++;
        dummy1=dummy1/10;
        
        NSLog(@"hey dude");
    }
    
    return numOfnumerator;

}
-(void)lastsep:(int)size
{
    NSLog(@"inside lastsep method");
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(200,50)];
    
    [path addLineToPoint:CGPointMake(200+(size*6.5),50)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
    shapeLayer.lineWidth = 1.0;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    [self.a.layer addSublayer:shapeLayer];
    
    
}

-(void)displaySimple:(Fraction*)ans
{
    
    NSLog(@"inside display simple");
    int q = abs(ans.numerator/ans.denominator);
    int r = abs(ans.numerator%ans.denominator);
    ViewCalc *c= [[ViewCalc alloc]initWithFrame:CGRectMake(200,39,90,12)];
    
    c.text = [NSString stringWithFormat:@"%d",r];
    c.x = 0;
    c.y =0;
    
    [self.a addSubview:c];
    
    ViewCalc *d= [[ViewCalc alloc]initWithFrame:CGRectMake(200,50,90,12)];
    
    d.text = [NSString stringWithFormat:@"%d",abs(ans.denominator)];
    d.x = 0;
    d.y =0;
    
    [self.a addSubview:d];
    
    
    int numofQ = [self countNumbers:q];
    
    ViewCalc *e = [[ViewCalc alloc]initWithFrame:CGRectMake(200-(numofQ*7),43,(numofQ*7),10)];
    
    e.text = [NSString stringWithFormat:@"%d",q];
    e.x = 0;
    e.y =0;

    [self.a addSubview:e];
    [self lastsep:[self countNumbers:ans.denominator]];
    
    if(ans.numerator<0)
    {
        
        ans.numerator=-ans.numerator;
        ViewCalc *b = [[ViewCalc alloc]initWithFrame:CGRectMake(200-(numofQ*7)-10,43,7,10)];
        
        b.text = @"-";
        b.x = 0;
        b.y =0;
        
        [self.a addSubview:b];
        
    }
    if(ans.denominator<0)
    {
        
        ans.denominator=-ans.denominator;
        ViewCalc *b = [[ViewCalc alloc]initWithFrame:CGRectMake(200-(numofQ*7)-10,43,7,10)];
        
        b.text = @"-";
        b.x = 0;
        b.y =0;
        
        [self.a addSubview:b];
        
    }

}

-(BOOL)checkZero
{
    for(id i in self.fractions)
    {
        
        if([i isKindOfClass:[Fraction class]])
        {
            Fraction *temp = (Fraction*)i;
            if(temp.denominator==0)
            {
                
                [self giveError:@"Divide by zero Error"];
                return YES;

            }
        }
           
        
    }
    return NO;
}
@end
