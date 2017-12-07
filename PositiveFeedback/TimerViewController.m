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
    timeElapsed = 0;
    timerCountSLabel.text = [NSString stringWithFormat:@"00.0"];
    timerCountMLabel.text = [NSString stringWithFormat:@"00"];
    _releaseHintLabel.hidden = TRUE;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
}
-(IBAction)startTimer:(id)sender{
    if ([justInvalidated isEqualToString:@"YES"]) {
        justInvalidated = @"NO";
    } else {
        startTime = [NSDate date];
        timeElapsed = 0;
        secondsTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
        _releaseHintLabel.hidden = TRUE;
        self.view.backgroundColor = [UIColor darkGrayColor];
        [startUIButton setTitle:@"Stop" forState:UIControlStateNormal];
    }
}
- (IBAction)startTouchDown:(id)sender {
    if ([secondsTimer isValid]) {
        NSLog(@"Touch Down ELSE");
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
    timerCountSLabel.text = [NSString stringWithFormat:@"0%.2", timeElapsed];
    
}
@end
