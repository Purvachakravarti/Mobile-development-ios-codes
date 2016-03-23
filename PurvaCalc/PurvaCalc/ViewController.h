//
//  ViewController.h
//  PurvaCalc
//
//  Created by Purva Chakarvarti on 10/2/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;


- (IBAction)clearButton:(id)sender;
- (IBAction)division:(id)sender;
- (IBAction)multiplication:(id)sender;
- (IBAction)substraction:(id)sender;
- (IBAction)addition:(id)sender;



- (IBAction)Equal:(id)sender;
- (IBAction)sqroot:(id)sender;
- (IBAction)negate:(id)sender;



- (IBAction)Nine:(id)sender;
- (IBAction)Eight:(id)sender;
- (IBAction)Seven:(id)sender;
- (IBAction)Six:(id)sender;
- (IBAction)Five:(id)sender;
- (IBAction)Four:(id)sender;
- (IBAction)Three:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)one:(id)sender;
- (IBAction)zero:(id)sender;




@end

