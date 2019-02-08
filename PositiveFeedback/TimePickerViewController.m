//
//  ViewController.m
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import "TimePickerViewController.h"
#import "TimerViewController.h"
#import "EndlessViewController.h"

@interface TimePickerViewController (){
    NSArray *_goalMinutesPickerData;
    NSArray *_goalSecondsPickerData;
}
@end

@implementation TimePickerViewController
@synthesize runDistance;
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
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        _goalMinutes = [_goalMinutesPickerData objectAtIndex:row];
    } else {
        _goalSeconds = [_goalSecondsPickerData objectAtIndex:row];
    }
    if (_goalMinutes == NULL) {
        _goalMinutes = 0;
    }
    if (_goalSeconds == NULL) {
        _goalSeconds = 0;
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goalDataShare"]) {
        TimerViewController *destViewController = segue.destinationViewController;
        destViewController.goalSeconds = _goalSeconds;
        destViewController.goalMinutes = _goalMinutes;
        destViewController.runDistance = runDistance;
    }
    if ([segue.identifier isEqualToString:@"endlessDataShare"]){
        EndlessViewController *destViewController = segue.destinationViewController;
        destViewController.goalSeconds = _goalSeconds;
        destViewController.goalMinutes = _goalMinutes;
    }
}
- (IBAction)nextButtonAction:(id)sender {
    if ([runDistance  isEqual: @(-1.0)]) {
        [self performSegueWithIdentifier:@"endlessDataShare" sender:self];
    } else {
        [self performSegueWithIdentifier:@"goalDataShare" sender:self];
    }
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender   {
    if (_goalMinutes == 0) {
        if (_goalSeconds == 0) {
            UIAlertController *invalid = [UIAlertController alertControllerWithTitle:@"Invalid goal time" message:@"Please enter a valid goal" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [invalid addAction:okAction];
            [self presentViewController:invalid animated:YES completion:nil];
            return NO;
        } else {
            return YES;
        }
    } else {
        return YES;
    }
}
@end
