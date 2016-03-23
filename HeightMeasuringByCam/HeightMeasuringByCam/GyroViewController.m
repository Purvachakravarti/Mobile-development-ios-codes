//
//  GyroViewController.m
//  HeightMeasuringByCam
//
//  Created by Purva Chakarvarti on 11/18/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import "GyroViewController.h"

@interface GyroViewController ()

@end



@implementation GyroViewController

@synthesize accelerationX;
@synthesize accelerationY;
@synthesize accelerationZ;
@synthesize pitchLabel;
@synthesize yawLabel;
@synthesize rollLabel;


#define degrees(x) (180* x/M_PI)


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    motionManager = [[CMMotionManager alloc]init];
    motionManager.deviceMotionUpdateInterval = 1/60;
    [motionManager startDeviceMotionUpdates];
    timer = [NSTimer scheduledTimerWithTimeInterval:(1/60) target:self selector:@selector(read) userInfo:nil repeats:YES];
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
                accelerationX.text=x;
                NSString *y = [[NSString alloc]initWithFormat:@"%.02f",gyroData.rotationRate.y];
                accelerationY.text=y;
                NSString *z = [[NSString alloc]initWithFormat:@"%.02f",gyroData.rotationRate.z];
                accelerationZ.text=z;
            }
            ];
            
        }
        else {
            
            NSLog(@"gyro is not active");
            
        }
    }
    else
    {
        UIAlertView *alert=  [[UIAlertView alloc]initWithTitle:@"NO GYRO" message:@"Get A GYro" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
        [alert show];
    }
}
-(void)read{
    CMAttitude *attitude;
    CMDeviceMotion *motion=motionManager.deviceMotion;
    attitude = motion.attitude;
    
    NSString *yaw = [NSString stringWithFormat:@"Yaw: %f", degrees(attitude.yaw)];
    yawLabel.text=yaw;
    
    NSString *pitch = [NSString stringWithFormat:@"Pitch: %f", degrees(attitude.pitch)];
    pitchLabel.text=pitch;
    
    NSString *roll = [NSString stringWithFormat:@"Roll: %f", degrees(attitude.roll)];
    rollLabel.text=roll;
}

-(void)viewDidUnload
{
    [self setAccelerationX:nil];
    [self setAccelerationY:nil];
    [self setAccelerationZ:nil];
    [self setRollLabel:nil];
    [self setPitchLabel:nil];
    [self setYawLabel:nil];
    [super viewDidUnload];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
