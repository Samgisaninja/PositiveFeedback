//
//  ViewController.m
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController (){
    NSArray *_goalMinutesPickerData;
    NSArray *_goalSecondsPickerData;
}
@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _goalMinutesPickerData = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11",                @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30"];
    _goalSecondsPickerData = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36", @"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53", @"54", @"55", @"56", @"57", @"58", @"59"];
    self.goalTimePicker.dataSource = self;
    self.goalTimePicker.delegate = self;
}
- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [_goalMinutesPickerData count];
    } else {
        return [_goalSecondsPickerData count];
    }
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [_goalMinutesPickerData objectAtIndex:row];
    } else {
        return [_goalSecondsPickerData objectAtIndex:row];
    }
    
}
@end
