//
//  ViewController.h
//  PurvaBMI
//
//  Created by Purva Chakarvarti on 9/19/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *heightText;
@property (weak, nonatomic) IBOutlet UILabel *incLabel;

@property (weak, nonatomic) IBOutlet UITextField *weightText;
@property (weak, nonatomic) IBOutlet UILabel *poLabel;

- (IBAction)switchConnect:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *Range;

- (IBAction)calc:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *bmiLabel;
@property (weak, nonatomic) IBOutlet UILabel *bmiDescr;
@property (weak, nonatomic) IBOutlet UIImageView *bmiImages;


@end