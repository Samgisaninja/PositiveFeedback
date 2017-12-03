//
//  ViewController.m
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *_goalTimePickerData;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    timerCountS = 0;
    timerCountMInt = 0;
    timerCountSLabel.text = [NSString stringWithFormat:@"00.0"];
    timerCountMLabel.text = [NSString stringWithFormat:@"00"];
    _goalTimePickerData = @[ @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11",                @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30"], @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36", @"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53", @"54", @"55", @"56", @"57", @"58", @"59"] ];
    self.goalTimePicker.dataSource = self;
    self.goalTimePicker.delegate = self;
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
// The number of columns of data
- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 100;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _goalTimePickerData[component][row];
}
@end
