//
//  TimerViewController.m
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import "TimerViewController.h"
#import <AudioToolbox/AudioToolbox.h>
@interface TimerViewController ()
@end

@implementation TimerViewController
@synthesize goalSeconds;
@synthesize goalMinutes;
@synthesize runDistance;

- (void)viewDidLoad {
    [super viewDidLoad];
    timerCountSLabel.text = [NSString stringWithFormat:@"00.00"];
    timerCountMLabel.text = [NSString stringWithFormat:@"00"];
    _releaseHintLabel.hidden = TRUE;
    timeElapsed = 0;
    runDistance = @(3.125);
    intervalsPassed = 0;
    _goalTime = [goalSeconds floatValue] + [goalMinutes floatValue] * 60;
    NSLog(@"%f", _goalTime);
    _goalInterval = _goalTime / [runDistance floatValue];
}
-(void)update{
    NSTimeInterval currentUnixTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timeElapsed = currentUnixTime - [startTime timeIntervalSince1970];
    int minutesElapsed = (int) timeElapsed / 60;
    timeElapsed -= minutesElapsed * 60;
    if (timeElapsed < 10) {
        timerCountSLabel.text = [NSString stringWithFormat:@"0%.2f",timeElapsed];
    } else {
        timerCountSLabel.text = [NSString stringWithFormat:@"%.2f",timeElapsed];
    }
    if (minutesElapsed < 10) {
        timerCountMLabel.text = [NSString stringWithFormat:@"0%.1d",minutesElapsed];
    } else {
        timerCountMLabel.text = [NSString stringWithFormat:@"%.1d",minutesElapsed];
    }
    float progressToInterval = currentUnixTime - [relativeStartTime timeIntervalSince1970];
    if (progressToInterval > _goalInterval) {
        relativeStartTime = [NSDate date];
        intervalsPassed = intervalsPassed + 1;
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    self.progressBar.progress = timeElapsed / _goalTime;
    if (timeElapsed > _goalTime + 0.1) {
        [secondsTimer fire];
        [secondsTimer invalidate];
        justInvalidated = @"YES";
        [startUIButton setTitle:@"Hold and release to start" forState:UIControlStateNormal];
    }
    
}
-(IBAction)startTimer:(id)sender{
    if ([justInvalidated isEqualToString:@"YES"]) {
        justInvalidated = @"NO";
    } else {
        startTime = [NSDate date];
        relativeStartTime = [NSDate date];
        timeElapsed = 0;
        secondsTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
        _releaseHintLabel.hidden = TRUE;
        self.view.backgroundColor = [UIColor darkGrayColor];
        [startUIButton setTitle:@"Stop" forState:UIControlStateNormal];
    }
}
- (IBAction)startTouchDown:(id)sender {
    if ([secondsTimer isValid]) {
        [secondsTimer fire];
        [secondsTimer invalidate];
        justInvalidated = @"YES";
        [startUIButton setTitle:@"Hold and release to start" forState:UIControlStateNormal];
    } else {
            self.view.backgroundColor = [UIColor greenColor];
            _releaseHintLabel.hidden = FALSE;
    }
}

-(IBAction)resetTimer:(id)sender{
    [secondsTimer invalidate];
    timeElapsed = 0;
    timerCountSLabel.text = [NSString stringWithFormat:@"00.00"];
    timerCountMLabel.text = [NSString stringWithFormat:@"00"];
    [startUIButton setTitle:@"Hold and release to start" forState:UIControlStateNormal];
    
}
@end
