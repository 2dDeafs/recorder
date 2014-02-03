//
//  ViewController.h
//  Recorder
//
//  Created by Matheus Cardoso on 2/3/14.
//  Copyright (c) 2014 Matheus Cardoso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController <AVAudioRecorderDelegate>
@property NSURL *tempRecord;
@property BOOL isRecording;
@property AVAudioRecorder *recorder;

@end
