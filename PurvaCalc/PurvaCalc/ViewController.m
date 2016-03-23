//
//  ViewController.m
//  PurvaCalc
//
//  Created by Purva Chakarvarti on 10/2/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "SimpleStack.h"
#import "InfixToPostfix.h"



int flagneg=0;

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

     }
    // Do any additional setup after loading the view, typically from a nib.

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)clearButton:(id)sender {
    
    self.textField.text=[NSString stringWithFormat:@""];
    
    
}


- (IBAction)division:(id)sender {
    
    NSString *numdiv= self.textField.text;
    self.textField.text=[NSString stringWithFormat:@"%@/",numdiv];
    
   
    
}

- (IBAction)multiplication:(id)sender {
    
    NSString *nummulti= self.textField.text;
    self.textField.text=[NSString stringWithFormat:@"%@x",nummulti];
    
}

- (IBAction)substraction:(id)sender
    {
    
    NSString *numsub= self.textField.text;
    self.textField.text=[NSString stringWithFormat:@"%@-",numsub];
   
    }

- (IBAction)addition:(id)sender {
    
    NSString *numadd= self.textField.text;
    self.textField.text=[NSString stringWithFormat:@"%@+",numadd];
}


- (IBAction)Equal:(id)sender {
   
    InfixToPostfix *itp = [[InfixToPostfix alloc]init];
    NSString* infixexp = [[NSString alloc]init];
    infixexp = self.textField.text;
    NSString *postexp = [itp parseToInfix:infixexp];
    
    
    NSLog(@"%@",postexp);
    Calculator *c=[[Calculator alloc]init];
    NSObject* result =[c compute:postexp];
    self.textField.text=[NSString stringWithFormat:@"%@",result];
}


- (IBAction)Nine:(id)sender {
    
    NSString *num9= self.textField.text;
    if ([num9 isEqual:@"0"])
    {
        self.textField.text=[NSString stringWithFormat:@"9"];
        

        
    }
    else
    {
        self.textField.text=[NSString stringWithFormat:@"%@9",num9];
      
        
    }
}

- (IBAction)Eight:(id)sender {
    NSString *num8= self.textField.text;
    if ([num8 isEqual:@"0"])
    {
        self.textField.text=[NSString stringWithFormat:@"8"];
     

    }
    else
    {
    self.textField.text=[NSString stringWithFormat:@"%@8",num8];
       

    }
}

- (IBAction)Seven:(id)sender {
NSString *num7= self.textField.text;
   if ([num7 isEqual:@"0"])
    {
        self.textField.text=[NSString stringWithFormat:@"7"];
       
    }
    else
    {
    self.textField.text=[NSString stringWithFormat:@"%@7",num7];
       

   }
}

- (IBAction)Six:(id)sender {
    NSString *num6= self.textField.text;
    if ([num6 isEqual:@"0"])
    {
        self.textField.text=[NSString stringWithFormat:@"6"];
        
    }
    
    else
    {
    self.textField.text=[NSString stringWithFormat:@"%@6",num6];

    }
}

- (IBAction)Five:(id)sender {
    NSString *num5= self.textField.text;
    if ([num5 isEqual:@"0"])
    {
        self.textField.text=[NSString stringWithFormat:@"5"];
     

    }
    else
    {
    self.textField.text=[NSString stringWithFormat:@"%@5",num5];
       

    }
}

- (IBAction)Four:(id)sender {
    NSString *num4= self.textField.text;
    if ([num4 isEqual:@"0"])
    {
        self.textField.text=[NSString stringWithFormat:@"4"];
       

    }
    else
    {
    self.textField.text=[NSString stringWithFormat:@"%@4",num4];
    }
}

- (IBAction)Three:(id)sender {
    NSString *num3= self.textField.text;
    if ([num3 isEqual:@"0"])
    {
        self.textField.text=[NSString stringWithFormat:@"3"];
       

    }
    else
    {
    self.textField.text=[NSString stringWithFormat:@"%@3",num3];
        

    }
}

- (IBAction)two:(id)sender {
    NSString *num2= self.textField.text;
    if ([num2 isEqual:@"0"])
    {
        self.textField.text=[NSString stringWithFormat:@"2"];
    

    }
    else
    {
    self.textField.text=[NSString stringWithFormat:@"%@2",num2];
       

    }
}

- (IBAction)one:(id)sender {
    
    NSString *num1= self.textField.text;
    if ([num1 isEqual:@"0"])
    {
        self.textField.text=[NSString stringWithFormat:@"1"];

    }
    else
    {
    self.textField.text=[NSString stringWithFormat:@"%@1",num1];
      

    }
}

- (IBAction)zero:(id)sender {
    
    NSString *num0= self.textField.text;
    if ([num0 isEqual:@"0"])
    {
        self.textField.text=[NSString stringWithFormat:@"0"];
 

    }
    else
    {
        self.textField.text=[NSString stringWithFormat:@"%@0",num0];
      

    }
    
}

- (IBAction)sqroot:(id)sender {
  
    InfixToPostfix *itp = [[InfixToPostfix alloc]init];
    NSString* infixexp = [[NSString alloc]init];
    infixexp = self.textField.text;
    NSString *postexp = [itp parseToInfix:infixexp];
    
    
    NSLog(@"%@",postexp);
    Calculator *c=[[Calculator alloc]init];
    NSDecimalNumber* result =[c compute:postexp];
    
    double sqrtres= sqrt([result doubleValue]);
    self.textField.text=[NSString stringWithFormat:@"%f",sqrtres];
    
}
- (IBAction)negate:(id)sender {
    NSString *numminus= self.textField.text;
    if ([numminus isEqual:@"0"])
    {
        self.textField.text=[NSString stringWithFormat:@"-"];
     
        
    }
    else
    {
        self.textField.text=[NSString stringWithFormat:@"%@-",numminus];
    
        
    }
}



@end