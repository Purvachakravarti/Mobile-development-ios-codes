//
//  ShowOverlayViewController.m
//  HeightMeasuringByCam
//
//  Created by Purva Chakarvarti on 11/22/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import "ShowOverlayViewController.h"
#import "OverlayViewController.h"
#import "Singleton.h"


//transform values for full screen support
#define CAMERA_TRANSFORM_X 1
#define CAMERA_TRANSFORM_Y 1.12412

//iphone screen dimensions
#define SCREEN_WIDTH  320
#define SCREEN_HEIGTH 480


@interface ShowOverlayViewController ()

@end

@implementation ShowOverlayViewController

UIImagePickerController *picker;
AVCaptureSession *session;
AVCaptureStillImageOutput *stillImageOutput;
#define degrees(x) (180* x/M_PI)
float fpitch;
int flag=0;


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.HeightTextfield resignFirstResponder];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    picker = [[UIImagePickerController alloc] init];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(distroyPicker) name:@"destroyPicker" object:nil];
    motionManager = [[CMMotionManager alloc]init];
    motionManager.deviceMotionUpdateInterval = 1/1
    ;
    [motionManager startDeviceMotionUpdates];
    timer = [NSTimer scheduledTimerWithTimeInterval:(1/1) target:self selector:@selector(read) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    if([motionManager isGyroAvailable])
    {
        if(![motionManager isGyroActive])
        {
            NSLog(@"gyro is active");
            [motionManager setGyroUpdateInterval:1];
            [motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData *gyroData, NSError *error)
             {
                 NSString *x = [[NSString alloc]initWithFormat:@"%.02f",gyroData.rotationRate.x];
                // NSLog(@"%@",x);
                 // accelerationX.text=x;
                 NSString *y = [[NSString alloc]initWithFormat:@"%.02f",gyroData.rotationRate.y];
                // NSLog(@"%@",y);
                 // accelerationY.text=y;
                 NSString *z = [[NSString alloc]initWithFormat:@"%.02f",gyroData.rotationRate.z];
                // NSLog(@"%@",z);
                 // accelerationZ.text=z;
             }
             ];
            
        }
        else
        {
            
            NSLog(@"gyro is not active");
        }
    }
    else
    {
        UIAlertView *alert=  [[UIAlertView alloc]initWithTitle:@"NO GYRO" message:@"Get A GYro" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
        [alert show];
    }
    
}

-(void)distroyPicker {
    
    [picker dismissViewControllerAnimated:YES completion:^{
     NSLog(@"destroying picker");
    }];
    
}

-(void)read
{
     Singleton *p =[Singleton sharedValue];
    
    CMAttitude *attitude;
    CMDeviceMotion *motion=motionManager.deviceMotion;
    attitude = motion.attitude;
   // float gravity;
   
   
   // NSLog(@"Yaw:%f",degrees(attitude.yaw));
   // NSLog(@"roll:%f",degrees(attitude.roll));
    
    fpitch = attitude.pitch;
    NSLog(@"in degrees %f", degrees(fpitch));
    float degreeAngle = degrees(fpitch);

  p.pitch = [NSNumber numberWithFloat:degreeAngle];
    p.gravityZ= [NSNumber numberWithDouble:(motion.gravity.z)];
   NSLog(@"Pitch:%f %f %f %f ",degrees(attitude.pitch), motion.gravity.x, motion.gravity.y, motion.gravity.z);
//    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)showCameraOverlay:(id)sender {
    
    Singleton *s =[Singleton sharedValue];
    if(flag==0)
    {
    NSString *obtainedHeight = [self.HeightTextfield text];
    s.height = [NSNumber numberWithFloat:[obtainedHeight floatValue]];
    NSLog(@"%@ checking height.... ",[s height]);
    }
    else if(flag==1)
    {
        NSString *obtainedHeight = [self.HeightTextfield text];
        s.height = [NSNumber numberWithFloat:[obtainedHeight floatValue]*100];
        NSLog(@"%@ checking height.... ",[s height]);
        
    }
    
    
    if([[self.HeightTextfield text] isEqualToString:@""])
    {
        self.TextFieldError.text=[NSString stringWithFormat:@"Sorry!Please enter your height first"];
    }
    else
    {
        self.TextFieldError.text=[NSString stringWithFormat:@"Good Job"];
        OverlayViewController *overlay = [[OverlayViewController alloc]
                            initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGTH)];
    
    //create a new image picker instance
   
    
    //set source to video!
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    //hide all controls
    picker.showsCameraControls = NO;
    picker.navigationBarHidden = YES;
    picker.toolbarHidden = YES;
    
    //make the video preview full size
    picker.wantsFullScreenLayout = YES;
        
    picker.cameraViewTransform = CGAffineTransformScale(picker.cameraViewTransform,CAMERA_TRANSFORM_X,CAMERA_TRANSFORM_Y);
        
    //set our custom overlay view
    picker.cameraOverlayView = overlay;
    
    //show picker
    [self presentModalViewController:picker animated:YES];	
    
    }
}
- (IBAction)switch:(id)sender {
    self.labelcm.hidden=NO;
    if([sender isOn])
    {
        flag = 0;
        Singleton *change = [Singleton sharedValue];
        change.height=self.HeightTextfield.text;
        [change mToCm];
        self.HeightTextfield.text = [NSString stringWithFormat:@"%@",change.height];
        self.labelcm.text=[NSString stringWithFormat:@"centimeters"];
     
    }
    else
    {
        flag = 1;
        Singleton *change = [Singleton sharedValue];
        change.height=self.HeightTextfield.text;
        [change cmToM];
        self.HeightTextfield.text = [NSString stringWithFormat:@"%@",change.height];
        self.labelcm.text=[NSString stringWithFormat:@"meters"];
       
        
    }
}
@end
