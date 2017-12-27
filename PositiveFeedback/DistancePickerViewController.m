//
//  ViewController.m
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import "DistancePickerViewController.h"
#import "TimerViewController.h"

@interface DistancePickerViewController (){
    NSArray *distancePickerData;
}
@end

@implementation DistancePickerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    distancePickerData = @[@"", @"800m (pings every 400m)", @"1600m (pings every 400m)", @"3200m (pings every 1600m)", @"3200m (pings every 400m)", @"5K (pings every mile)", @"5K (pings every 1K)"];
    self.distancePicker.dataSource = self;
    self.distancePicker.delegate = self;
}
- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
        return [distancePickerData count];
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
        return [distancePickerData objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _runDistanceString = [distancePickerData objectAtIndex:row];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goalDataShare"]) {
        TimerViewController *destViewController = segue.destinationViewController;
    }
}
@end
