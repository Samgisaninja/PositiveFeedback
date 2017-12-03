//
//  TimerViewController.m
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()
@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    timerCountS = 0;
    timerCountMInt = 0;
    timerCountSLabel.text = [NSString stringWithFormat:@"00.0"];
    timerCountMLabel.text = [NSString stringWithFormat:@"00"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)updateSeconds{
    NSTimeInterval currentUnixTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timerCountS = currentUnixTime - [relativeStartTime timeIntervalSince1970];
    if (timerCountS < 10) {
        timerCountSLabel.text = [NSString stringWithFormat:@"0%.2f",timerCountS];
    } else {
        timerCountSLabel.text = [NSString stringWithFormat:@"%.2f",timerCountS];
    }
}
-(void)updateMinutes{
    NSTimeInterval currentUnixTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timerCountS = currentUnixTime - [startTime timeIntervalSince1970];
    NSInteger timerCountMInt = timerCountS;
    NSInteger timerCountMIntDivided = timerCountMInt / 60;
    if (timerCountMIntDivided < 10) {
        timerCountMLabel.text = [NSString stringWithFormat:@"0%.1ld",(long)timerCountMIntDivided];
    } else {
        timerCountMLabel.text = [NSString stringWithFormat:@"%.1ld",(long)timerCountMIntDivided];
    }
    
    relativeStartTime = [NSDate date];
}
-(IBAction)startTimer:(id)sender{
    [secondsTimer invalidate];
    [minutesTimer invalidate];
    startTime = [NSDate date];
    relativeStartTime = [NSDate date];
    timerCountS = 0;
    timerCountMInt = 0;
    secondsTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateSeconds) userInfo:nil repeats:YES];
    minutesTimer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(updateMinutes) userInfo:nil repeats:YES];
    [minutesTimer fire];
}
-(IBAction)stopTimer:(id)sender{
    [secondsTimer fire];
    [secondsTimer invalidate];
}
-(IBAction)resetTimer:(id)sender{
    [secondsTimer invalidate];
    timerCountS = 0;
    timerCountSLabel.text = [NSString stringWithFormat:@"00.0"];
    timerCountMLabel.text = [NSString stringWithFormat:@"00"];
}
@end
