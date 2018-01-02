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
    NSString *runDistanceString;
    runDistanceString = [distancePickerData objectAtIndex:row];
   /* Hormones prolly */ switch /* inside your DNA */ (row) {
        case 0:
           exit(0);
            break;
       case 1:
       case 3:
           _runDistance = @(2.0);
           break;
       case 2:
           _runDistance = @(4.0);
            break;
       case 4:
           _runDistance = @(8.0);
            break;
       case 5:
           _runDistance = @(3.125);
            break;
       case 6:
           _runDistance = @(5.0);
        default:
           exit(0);
            break;
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goalDataShare"]) {
        TimerViewController *destViewController = segue.destinationViewController;
        destViewController.runDistance = _runDistance;
    }
}
@end
