//
//  GyroViewController.h
//  HeightMeasuringByCam
//
//  Created by Purva Chakarvarti on 11/18/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.


#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface GyroViewController : UIViewController
{
    CMMotionManager *motionManager;
    NSOperationQueue *operationQueue;
    NSTimer *timer;
    
}

@property (weak, nonatomic) IBOutlet UILabel *accelerationX;

@property (weak, nonatomic) IBOutlet UILabel *accelerationY;
@property (weak, nonatomic) IBOutlet UILabel *accelerationZ;
@property (weak, nonatomic) IBOutlet UILabel *pitchLabel;
@property (weak, nonatomic) IBOutlet UILabel *rollLabel;

@property (weak, nonatomic) IBOutlet UILabel *yawLabel;
@end
