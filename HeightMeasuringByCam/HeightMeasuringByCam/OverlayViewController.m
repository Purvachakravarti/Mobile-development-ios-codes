//
//  OverlayViewController.m
//  HeightMeasuringByCam
//
//  Created by Purva Chakarvarti on 11/22/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "OverlayViewController.h"
#import "Singleton.h"
UILabel  * anglelabel1;
UILabel  * anglelabel2;
UILabel  *distanceLabel;
UILabel  * heightlabelincm;
UILabel  * heightlabelinm;
UIButton *goBack;
float newDistance;

@interface OverlayViewController ()

@end

@implementation OverlayViewController

float HOB;
int newflag=0;


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //clear the background color of the overlay
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        

        UIImage *crosshair = [UIImage imageNamed:@"crosshair_1_violet.png"];
        UIButton *crosshairbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [crosshairbutton addTarget:self action:@selector(crosshairButtonWork)
         forControlEvents:UIControlEventTouchUpInside];
        [crosshairbutton setImage:crosshair forState: UIControlStateNormal];
        crosshairbutton.frame = CGRectMake(0, 40, 320, 300);
        [self addSubview:crosshairbutton];
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(operationView)
         forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"What to do?" forState:UIControlStateNormal];
        button.frame = CGRectMake(100, 430, 320, 10);
            [self addSubview:button];
        
        goBack = [UIButton buttonWithType:UIButtonTypeCustom];
        [goBack addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        [goBack setTitle:@"Start Over" forState:UIControlStateNormal];
        goBack.frame = CGRectMake(-100, 430, 320, 10);
        [self addSubview:goBack];
        
    }
    return self;
}

-(void)goBack {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"destroyPicker" object:nil];

}


-(void)crosshairButtonWork
{
    Singleton *heightOfObject= [Singleton sharedValue];
    
  //  [anglelabel1 removeFromSuperview];
    [anglelabel2 removeFromSuperview];
    [distanceLabel removeFromSuperview];
    [heightlabelincm removeFromSuperview];
    [heightlabelinm removeFromSuperview];
    
    if(newflag==0)
    {
    heightOfObject.angle1=heightOfObject.pitch;
    heightOfObject.angle1 =[NSNumber numberWithFloat:( 90-[heightOfObject.angle1 floatValue])];
    anglelabel1= [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 200, 30)];
    anglelabel1.backgroundColor = [UIColor blackColor];
    anglelabel1.textAlignment = UITextAlignmentLeft;
    anglelabel1.textColor=[UIColor redColor];
    [self  addSubview:anglelabel1];
    anglelabel1.hidden=NO;
    anglelabel1.text = [NSString stringWithFormat:@"angle 1 :%@",heightOfObject.angle1];
    newflag++;
    }
    else if(newflag==1)
    {
    heightOfObject.angle2=heightOfObject.pitch;
    heightOfObject.gravityValue=heightOfObject.gravityZ;
    heightOfObject.angle2 =[NSNumber numberWithFloat:( 90-[heightOfObject.angle2 floatValue])];
    anglelabel2= [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 200, 30)];
    anglelabel2.backgroundColor = [UIColor blackColor];
    anglelabel2.textAlignment = UITextAlignmentLeft;
    anglelabel2.textColor=[UIColor redColor];
    [self  addSubview:anglelabel2];
    anglelabel2.hidden=NO;
    anglelabel2.text = [NSString stringWithFormat:@"angle 2 :%@",heightOfObject.angle2];
        
        if([heightOfObject.gravityValue doubleValue] > 0)
        {
            
            newDistance = ([heightOfObject.height floatValue]/ (tanf([heightOfObject.angle1 floatValue] * 0.017)));
            
            HOB = ([heightOfObject.height floatValue] + ( newDistance * tanf([heightOfObject.angle2 floatValue] * 0.017)));
            
            distanceLabel= [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 200, 30)];
            distanceLabel.backgroundColor = [UIColor blackColor];
            distanceLabel.textAlignment = UITextAlignmentLeft;
            distanceLabel.textColor=[UIColor redColor];
            [self  addSubview:distanceLabel];
            distanceLabel.hidden=NO;
            distanceLabel.text = [NSString stringWithFormat:@"distance: %.2f", newDistance];
        }
        else
        {
            
            newDistance = ([heightOfObject.height floatValue]/ (tanf([heightOfObject.angle1 floatValue] * 0.017)));
            HOB = ([heightOfObject.height floatValue] - (newDistance * tanf([heightOfObject.angle2 floatValue] * 0.017)));
            
            distanceLabel= [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 200, 30)];
            distanceLabel.backgroundColor = [UIColor blackColor];
            distanceLabel.textAlignment = UITextAlignmentLeft;
            distanceLabel.textColor=[UIColor redColor];
            [self  addSubview:distanceLabel];
            distanceLabel.hidden=NO;
            distanceLabel.text = [NSString stringWithFormat:@"distance: %.2f", newDistance];
            
        }
        
        heightlabelincm = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 200, 30)];
        heightlabelincm.backgroundColor = [UIColor blackColor];
        heightlabelincm.textAlignment = UITextAlignmentLeft;
        heightlabelincm.textColor=[UIColor redColor];
        [self  addSubview:heightlabelincm];
        heightlabelincm.text = [NSString stringWithFormat:@"Height(in cm) is: %.2f", HOB];
        newflag++;
        
        heightlabelinm = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 200, 30)];
        heightlabelinm.backgroundColor = [UIColor blackColor];
        heightlabelinm.textAlignment = UITextAlignmentLeft;
        heightlabelinm.textColor=[UIColor redColor];
        [self  addSubview:heightlabelinm];
        heightlabelinm.text = [NSString stringWithFormat:@"Height(in m) is: %.2f", (HOB/100)];
        newflag++;


    }
    
    else{
        newflag=0;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"destroyPicker" object:nil];
        
        
    }
    
    
    
//    float HOB = [heightOfObject.distance floatValue] * tanf([heightOfObject.angle floatValue] * 0.017);
       }


-(void)operationView
{
    
            UIAlertView *alert=  [[UIAlertView alloc]initWithTitle:@"1st: set the plus to the bottom of the object keeping your hand stable and click on plus,"@"                                          "@"2nd: set the plus to the top of object keeping your hand stable and click on plus "
                                  message:@"Click on ok to close the alert"
                                  delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];

}

@end
