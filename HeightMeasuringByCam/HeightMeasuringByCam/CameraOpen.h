//
//  CameraOpen.h
//  HeightMeasuringByCam
//
//  Created by Purva Chakarvarti on 11/15/15.
//  Copyright © 2015 Purva Chakarvarti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVCaptureOutput.h>

@interface CameraOpen : NSObject <AVCaptureVideoDataOutputSampleBufferDelegate>

- ( BOOL ) startCamera;
@end
