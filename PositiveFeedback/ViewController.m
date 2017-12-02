//
//  ViewController.m
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
    NSTimeInterval timerCountS = currentUnixTime - [startTime timeIntervalSince1970];
    if (timerCountS < 10) {
        timerCountSLabel.text = [NSString stringWithFormat:@"0%.1f",timerCountS];
    } else {
        timerCountSLabel.text = [NSString stringWithFormat:@"%.1f",timerCountS];
    }
}
-(void)updateMinutes{
    NSTimeInterval currentUnixTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timerCountS = currentUnixTime - [startTime timeIntervalSince1970];
    NSInteger timerCountMInt = timerCountS;
    NSInteger timerCountMIntDivided = timerCountMInt / 60;
    timerCountMLabel.text = [NSString stringWithFormat:@"%ld", (long)timerCountMIntDivided];
    startTime = [NSDate date];
}
-(IBAction)startTimer:(id)sender{
    [secondsTimer invalidate];
    [minutesTimer invalidate];
    startTime = [NSDate date];
    timerCountS = 0;
    timerCountMInt = 0;
    secondsTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateSeconds) userInfo:nil repeats:YES];
    minutesTimer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(updateMinutes) userInfo:nil repeats:YES];
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

