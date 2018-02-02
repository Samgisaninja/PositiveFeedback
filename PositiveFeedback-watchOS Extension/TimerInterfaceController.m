//
//  InterfaceController.m
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 1/8/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import "TimerInterfaceController.h"


@interface TimerInterfaceController ()

@end


@implementation TimerInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    //viewDidntLoad!
    _timerCountMLabel.text = [NSString stringWithFormat:@"00"];
    _timerCountSLabel.text = [NSString stringWithFormat:@"00.00"];
    [_startWKInterfaceButton setHidden:FALSE];
    [_stopWKInterfaceButton setHidden:TRUE];
    [_clearWKInterfaceButton setHidden:TRUE];
    timeElapsed = 0;
    intervalsPassed = 0;
    _runDistance = [context objectForKey:@"runDistance"];
    _goalMinutes = [context objectForKey:@"goalMinutes"];
    _goalSeconds = [context objectForKey:@"goalSeconds"];
    _goalTime = [_goalSeconds floatValue] + [_goalMinutes floatValue] * 60;
    _goalInterval = _goalTime / [_runDistance floatValue];
    // self.progressBar.progress = 0;
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
}

-(void)update{
    NSTimeInterval currentUnixTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timeElapsed = currentUnixTime - [startTime timeIntervalSince1970];
    int minutesElapsed = (int) timeElapsed / 60;
    timeElapsed -= minutesElapsed * 60;
    if (timeElapsed < 10) {
        _timerCountSLabel.text = [NSString stringWithFormat:@"0%.2f",timeElapsed];
    } else {
        _timerCountSLabel.text = [NSString stringWithFormat:@"%.2f",timeElapsed];
    }
    if (minutesElapsed < 10) {
        _timerCountMLabel.text = [NSString stringWithFormat:@"0%.1d",minutesElapsed];
    } else {
        _timerCountMLabel.text = [NSString stringWithFormat:@"%.1d",minutesElapsed];
    }
    float progressToInterval = currentUnixTime - [relativeStartTime timeIntervalSince1970];
    if (progressToInterval > _goalInterval) {
        relativeStartTime = [NSDate date];
        intervalsPassed = intervalsPassed + 1;
        NSLog(@"HAPTIC FEEDBACK HERE!!!");
    }
    /* self.progressBar.progress = timeElapsed / _goalTime;
    if (timeElapsed > _goalTime) {
        [self resetTimer];
    } */
}
-(IBAction)startTimer:(id)sender{
    startTime = [NSDate date];
    relativeStartTime = [NSDate date];
    timeElapsed = 0;
    secondsTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeDirectionDown];
    [_startWKInterfaceButton setHidden:TRUE];
    [_stopWKInterfaceButton setHidden:FALSE];
    [_clearWKInterfaceButton setHidden:TRUE];
}

- (IBAction)stopTimer:(id)sender {
        [secondsTimer fire];
        [secondsTimer invalidate];
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeStop];
    [_startWKInterfaceButton setHidden:TRUE];
    [_stopWKInterfaceButton setHidden:TRUE];
    [_clearWKInterfaceButton setHidden:FALSE];
}
- (IBAction)clearTimer:(id)sender {
    [self resetTimer];
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeClick];
    [_clearWKInterfaceButton setHidden:TRUE];
    [_stopWKInterfaceButton setHidden:TRUE];
    [_startWKInterfaceButton setHidden:FALSE];
    
}
-(void)resetTimer{
    [secondsTimer invalidate];
    timeElapsed = 0;
    _timerCountSLabel.text = [NSString stringWithFormat:@"00.00"];
    _timerCountMLabel.text = [NSString stringWithFormat:@"00"];
    // self.progressBar.progress = 0;
}

@end



