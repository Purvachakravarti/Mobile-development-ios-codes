//
//  ViewController.m
//  PurvaBMI
//
//  Created by Purva Chakarvarti on 9/19/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

int flag=0;

//on touching the textbox the keypad comes up and goes down as well later
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.heightText resignFirstResponder];
    [self.weightText resignFirstResponder];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"the view is loading");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*1inch=2.54cm
 1pound=.453kg*/

//code for switch on and off-conversion
- (IBAction)switchConnect:(id)sender
{
   //singleton class object created
    Person* Perperson = [Person sharedPerson];
    
    //taking the text from textbox and put it in singleton class variable
        NSString *str = [self.heightText text];
        Perperson.height = [NSNumber numberWithDouble:[str doubleValue]];
        NSLog(@"%@",str);
        NSString *str1 = [self.weightText text];
        Perperson.weight = [NSNumber numberWithDouble:[str1 doubleValue]];
        NSLog(@"%@",str1);
   
    
    if([sender isOn])
    {
        NSLog(@"Switch is ON");
        flag=0;
   
        [Perperson cmToInch_KgTolbs];//calling the method implemented in Person class
        
        self.heightText.text=[NSString stringWithFormat:@"%f",Perperson.height.doubleValue];
        self.weightText.text=[NSString stringWithFormat:@"%f",Perperson.weight.doubleValue];
       
        //conversion
        self.incLabel.hidden=NO;
        self.incLabel.text=[NSString stringWithFormat:@"IN"];
        self.poLabel.hidden=NO;
        self.poLabel.text=[NSString stringWithFormat:@"LBS"];
        
    }
    else if(![sender isOn])
    {
        NSLog(@"Switch is OFF");
        flag=1;
        [Perperson inchToCm_lbsToKg];//calling the method implemented in Person class

        self.heightText.text=[NSString stringWithFormat:@"%f",Perperson.height.doubleValue];
        self.weightText.text=[NSString stringWithFormat:@"%f",Perperson.weight.doubleValue];
      
        //conversion
        self.incLabel.hidden=NO;
        self.incLabel.text=[NSString stringWithFormat:@"CM"];
        self.poLabel.hidden=NO;
        self.poLabel.text=[NSString stringWithFormat:@"KG"];
    }
    
}

- (IBAction)calc:(id)sender
{
    //creating an object for displaying range image
    UIImageView *myimage1;
    myimage1.image = [UIImage imageNamed:@"range.png"];
    
    self.bmiLabel.hidden=NO;
    self.bmiDescr.hidden=NO;
    
     //singleton class object created
    Person* Perperson1 = [Person sharedPerson];
    
    
    //taking the text from textbox and put it in singleton class variable
        NSString *str = [self.heightText text];
        Perperson1.height = [NSNumber numberWithDouble:[str doubleValue]];
        NSLog(@"%@",str);
        NSString *str1 = [self.weightText text];
        Perperson1.weight = [NSNumber numberWithDouble:[str1 doubleValue]];
        NSLog(@"%@",str1);


    
    double dweight= [Perperson1.weight doubleValue];
    double dheight = [Perperson1.height doubleValue];
    double dbmi;
    
    UIImage *myImage;
//BMI calculation
    if (flag==0)//for in-lbs
    {
        dbmi= ((dweight)/(dheight*dheight))*703;
        
        self.bmiLabel.text=[NSString stringWithFormat:@"BMI: %f", dbmi];
        NSLog(@"bmi in in/lbs:%f",dbmi);
        
    }
    else
    {
        //for cm-kg
        dheight=dheight/100;
        dbmi= ((dweight)/(dheight*dheight));
        
        self.bmiLabel.text=[NSString stringWithFormat:@"BMI:%f", dbmi];
        NSLog(@"bmi in cm/kg:%f",dbmi);
    }
    
    //Range chart
    if(dbmi < 16.00)
    {
    
        self.bmiDescr.text = @"severe thinness";
        myImage = [UIImage imageNamed: @"1.png"];
        self.bmiImages.image= myImage;
        
    }
    else if(dbmi >=16.00 && dbmi<16.99)
    {
        self.bmiDescr.text = @"Moderate thinness";
        myImage = [UIImage imageNamed: @"1.png"];
        self.bmiImages.image = myImage;
    }
    else if(dbmi>=17.00 && dbmi<18.49)
    {
        self.bmiDescr.text = @"Mild thinness";
        myImage = [UIImage imageNamed: @"2.png"];
        self.bmiImages.image = myImage;
    }
    else if(dbmi >=18.50 && dbmi<24.99)
    {
        self.bmiDescr.text = @"Normal Range";
        myImage = [UIImage imageNamed: @"3.png"];
        self.bmiImages.image = myImage;
    }
    else if(dbmi >=25.00 && dbmi<29.99)
    {
        self.bmiDescr.text = @"OverWeight";
        myImage = [UIImage imageNamed: @"4.png"];
        self.bmiImages.image = myImage;
    }
    else if(dbmi >=30.00 && dbmi<34.99)
    {
        self.bmiDescr.text = @"Obese class I(Moderate)";
        myImage = [UIImage imageNamed: @"4.png"];
        self.bmiImages.image = myImage;
    }
    else if(dbmi >=35.00 && dbmi<39.99)
    {
        self.bmiDescr.text = @"Obese class II(Severe)";
        myImage = [UIImage imageNamed: @"5.png"];
        self.bmiImages.image = myImage;
    }
    else if(dbmi>=39.99)
    {
        self.bmiDescr.text = @"Obese class III(Very Severe)";
        myImage = [UIImage imageNamed: @"5.png"];
        self.bmiImages.image = myImage;
    }
}
   

@end
