//
//  EndlessViewController.m
//  PositiveFeedback
//
//  Created by Sam Gardner on 6/7/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import "EndlessViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface EndlessViewController ()
@end

@implementation EndlessViewController
@synthesize goalSeconds;
@synthesize goalMinutes;

- (void)viewDidLoad {
    [super viewDidLoad];
    timerCountSLabel.text = [NSString stringWithFormat:@"00.00"];
    timerCountMLabel.text = [NSString stringWithFormat:@"00"];
    _releaseHintLabel.hidden = TRUE;
    timeElapsed = 0;
    intervalsPassed = 0;
    _goalTime = [goalSeconds floatValue] + [goalMinutes floatValue] * 60;
    [_circularProgressBar setProgress:0 animated:FALSE];
}
-(void)update{
    NSTimeInterval currentUnixTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timeElapsed = currentUnixTime - [startTime timeIntervalSince1970];
    NSInteger timeElapsedInteger = timeElapsed;
    NSInteger minutesElapsed = (timeElapsedInteger / 60) % 60;
    NSTimeInterval secondsElapsed = timeElapsed - 60 * minutesElapsed;
    if (secondsElapsed < 10) {
        timerCountSLabel.text = [NSString stringWithFormat:@"0%.2f",secondsElapsed];
    } else {
        timerCountSLabel.text = [NSString stringWithFormat:@"%.2f",secondsElapsed];
    }
    if (minutesElapsed < 10) {
        timerCountMLabel.text = [NSString stringWithFormat:@"0%.1ld",(long)minutesElapsed];
    } else {
        timerCountMLabel.text = [NSString stringWithFormat:@"%.1ld",(long)minutesElapsed];
    }
    float progressToInterval = currentUnixTime - [relativeStartTime timeIntervalSince1970];
    if (progressToInterval > _goalTime) {
        relativeStartTime = [NSDate date];
        intervalsPassed = intervalsPassed + 1;
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    float progress = timeElapsed / _goalTime;
    [_circularProgressBar setProgress:progress animated:FALSE];
}
-(IBAction)startTimer:(id)sender{
    if ([justInvalidated isEqualToString:@"NO"]) {
        justInvalidated = @"YES";
    } else {
        startTime = [NSDate date];
        relativeStartTime = [NSDate date];
        timeElapsed = 0;
        secondsTimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(update) userInfo:nil repeats:YES];
        _releaseHintLabel.hidden = TRUE;
        self.view.backgroundColor = [UIColor whiteColor];
        [startUIButton setTitle:@"Stop" forState:UIControlStateNormal];
    }
}
- (IBAction)startTouchDown:(id)sender {
    if ([secondsTimer isValid]) {
        [secondsTimer fire];
        [secondsTimer invalidate];
        justInvalidated = @"NO";
        [startUIButton setTitle:@"Hold and release to start" forState:UIControlStateNormal];
    } else {
        self.view.backgroundColor = [UIColor greenColor];
        _releaseHintLabel.hidden = FALSE;
    }
}
- (IBAction)clearTimer:(id)sender {
    [self resetTimer];
}



-(void)resetTimer{
    [secondsTimer invalidate];
    timeElapsed = 0;
    timerCountSLabel.text = [NSString stringWithFormat:@"00.00"];
    timerCountMLabel.text = [NSString stringWithFormat:@"00"];
    [_circularProgressBar setProgress:0 animated:TRUE];
    [startUIButton setTitle:@"Hold and release to start" forState:UIControlStateNormal];
}


@end
