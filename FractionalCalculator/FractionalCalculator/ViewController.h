//
//  ViewController.h
//  FractionalCalculator
//
//  Created by Purva Chakravarti on 11/08/15.
//  Copyright (c) 2015 Purva Chakravarti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewCalc.h"
#import "Fraction.h"
#import "Calculate.h"
@interface ViewController : UIViewController

- (IBAction)label0:(id)sender;
- (IBAction)label1:(id)sender;
- (IBAction)label2:(id)sender;
- (IBAction)label3:(id)sender;
- (IBAction)label4:(id)sender;
- (IBAction)label5:(id)sender;
- (IBAction)label6:(id)sender;
- (IBAction)label7:(id)sender;
- (IBAction)label8:(id)sender;
- (IBAction)label9:(id)sender;

- (IBAction)allClear:(id)sender;
- (IBAction)multiply:(id)sender;
- (IBAction)add:(id)sender;
- (IBAction)subtract:(id)sender;
- (IBAction)divide:(id)sender;
- (IBAction)negate:(id)sender;
- (IBAction)Answer:(id)sender;
- (IBAction)squareRoot:(id)sender;
- (IBAction)separator:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *labelZero;
@property (weak, nonatomic) IBOutlet UIButton *labelOne;
@property (weak, nonatomic) IBOutlet UIButton *labelTwo;
@property (weak, nonatomic) IBOutlet UIButton *labelThree;
@property (weak, nonatomic) IBOutlet UIButton *labelFour;
@property (weak, nonatomic) IBOutlet UIButton *labelFive;
@property (weak, nonatomic) IBOutlet UIButton *labelSix;
@property (weak, nonatomic) IBOutlet UIButton *labelSeven;
@property (weak, nonatomic) IBOutlet UIButton *labelEight;
@property (weak, nonatomic) IBOutlet UIButton *labelNine;


@property (weak, nonatomic) IBOutlet UIButton *negate;
@property (weak, nonatomic) IBOutlet UIButton *root;
@property (weak, nonatomic) IBOutlet UIButton *labelAC;
@property (weak, nonatomic) IBOutlet UIButton *labelSep;
@property (weak, nonatomic) IBOutlet UIButton *labelAdd;
@property (weak, nonatomic) IBOutlet UIButton *labelMul;
@property (weak, nonatomic) IBOutlet UIButton *labelDiv;
@property (weak, nonatomic) IBOutlet UIButton *labelSub;
@property (weak, nonatomic) IBOutlet UIButton *labeAns;
@property (weak, nonatomic) IBOutlet UILabel *screenLabel;


@property ViewCalc *a;
@property ViewCalc *minus;

@property float nextx;
@property float nexty;
@property float sepx;
@property float sepy;

@property int sepflag;
@property float startOp;

@property NSMutableArray *fractions;

-(void)lastsep:(int)size;
-(int)countNumbers:(int)number;

@end

