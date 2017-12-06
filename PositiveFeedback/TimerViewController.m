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
    _releaseHintLabel.hidden = TRUE;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)update{
    NSTimeInterval currentUnixTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timerCountS = currentUnixTime - [startTime timeIntervalSince1970];
    int minutesElapsed = (int) timerCountS / 60;
    timerCountS -= minutesElapsed * 60;
    if (timerCountS < 10) {
        timerCountSLabel.text = [NSString stringWithFormat:@"0%.2f",timerCountS];
    } else {
        timerCountSLabel.text = [NSString stringWithFormat:@"%.2f",timerCountS];
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
        relativeStartTime = [NSDate date];
        timerCountS = 0;
        timerCountMInt = 0;
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
    timerCountS = 0;
    timerCountSLabel.text = [NSString stringWithFormat:@"0%.2f", timerCountS];
    
}
@end
