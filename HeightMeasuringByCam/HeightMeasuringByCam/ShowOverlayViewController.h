//
//  ShowOverlayViewController.h
//  HeightMeasuringByCam
//
//  Created by Purva Chakarvarti on 11/22/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMotion/CoreMotion.h>

@interface ShowOverlayViewController : UIViewController
{
    CMMotionManager *motionManager;
    NSOperationQueue *operationQueue;
    NSTimer *timer;
    
}

- (IBAction)showCameraOverlay:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *HeightTextfield;
@property (strong, nonatomic) IBOutlet UILabel *TextFieldError;
- (IBAction)switch:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *labelcm;

@end
