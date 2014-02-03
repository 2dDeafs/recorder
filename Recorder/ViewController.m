//
//  ViewController.m
//  Recorder
//
//  Created by Matheus Cardoso on 2/3/14.
//  Copyright (c) 2014 Matheus Cardoso. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btRecord;
@property (weak, nonatomic) IBOutlet UILabel *lblState;
@property (weak, nonatomic) IBOutlet UIButton *btPBack;

@end

@implementation ViewController
- (IBAction)Recording:(id)sender {
    if(!_isRecording){
        _btPBack.hidden = YES;
        _isRecording = YES;
        [_btRecord setTitle:@"Stop" forState:UIControlStateNormal];
        _lblState.text = @"Gravando..";
        _tempRecord = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:@"Voice File"]];
        
        _recorder = [[AVAudioRecorder alloc] initWithURL: _tempRecord settings:nil error:nil];
        [_recorder setDelegate:self];
        [_recorder prepareToRecord];
        [_recorder record];
    }
    else{
        
        _isRecording= NO;
        [_btRecord setTitle:@"Record" forState:UIControlStateNormal];
        _lblState.text = @"Gravado";
        [_recorder stop];
        //what
        _btPBack.hidden = NO;
    }
}

- (IBAction)Play:(id)sender {
    _lblState.text = @"Reproduzindo";
    _btRecord.hidden = YES;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:_tempRecord error:nil];
    player.volume = 1;
    
    if(player != nil){
    [player play];
    
    _lblState.text = @"Fim da Reprodução";

    }
}

- (void)viewDidLoad
{
    _lblState.text = @"Not Recording";
    _isRecording = NO;
    _btRecord.hidden = NO;
    
    AVAudioSession *RecAudio = [AVAudioSession sharedInstance];
    
    [RecAudio setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    [RecAudio setActive:YES error:nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

     
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
