//
//  ViewController.m
//  stopwatchtest
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
    timerCount = 0;
    timerCountLabel.text = [NSString stringWithFormat:@"0"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)updateLabel{
    NSTimeInterval currentUnixTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timerCount = currentUnixTime - [startTime timeIntervalSince1970];
    timerCountLabel.text = [NSString stringWithFormat:@"%.1f",timerCount];
}
-(IBAction)startTimer:(id)sender{
    [timer invalidate];
    startTime = [NSDate date];
    timerCount = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateLabel) userInfo:nil repeats:YES];
}
-(IBAction)stopTimer:(id)sender{
    [timer invalidate];
}
-(IBAction)resetTimer:(id)sender{
    [timer invalidate];
    timerCount = 0;
    timerCountLabel.text = [NSString stringWithFormat:@"0"];
}
@end

