//
//  LapsViewController.m
//  PositiveFeedback
//
//  Created by Sam Gardner on 2/7/19.
//  Copyright © 2019 Sam Gardner. All rights reserved.
//

#import "LapsViewController.h"
#import "TimePickerViewController.h"

@interface LapsViewController (){
    float runDistanceFloat;
}

@end

@implementation LapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[[self plusButton] layer] setCornerRadius:20];
    [[self plusButton] setClipsToBounds:TRUE];
    [[[self minusButton] layer] setCornerRadius:20];
    [[self minusButton] setClipsToBounds:TRUE];
    runDistanceFloat = 4.0;
    _runDistance = @(4.0);
    [[self runDistanceLabel] setText:[NSString stringWithFormat:@"%.f", roundf(runDistanceFloat)]];
}

-(IBAction)plusButtonAction:(id)sender{
    runDistanceFloat = runDistanceFloat + 1.0;
    _runDistance = @(roundf(runDistanceFloat));
    [[self runDistanceLabel] setText:[NSString stringWithFormat:@"%.f", roundf(runDistanceFloat)]];
}

-(IBAction)minusButtonAction:(id)sender{
    runDistanceFloat = runDistanceFloat - 1.0;
    _runDistance = @(roundf(runDistanceFloat));
    [[self runDistanceLabel] setText:[NSString stringWithFormat:@"%.f", roundf(runDistanceFloat)]];
}

-(IBAction)fiveKButton:(id)sender{
    _runDistance = @(3.125);
    [self performSegueWithIdentifier:@"distanceDataShare" sender:nil];
}

-(IBAction)endlessButton:(id)sender{
    _runDistance = @(-1.0);
    [self performSegueWithIdentifier:@"distanceDataShare" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"distanceDataShare"]) {
        TimePickerViewController *destViewController = segue.destinationViewController;
        destViewController.runDistance = _runDistance;
    }
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender   {
    if (_runDistance == NULL) {
        UIAlertController *invalid = [UIAlertController alertControllerWithTitle:@"Invalid goal distance" message:@"Please enter a valid goal" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [invalid addAction:okAction];
        [self presentViewController:invalid animated:YES completion:nil];
        return NO;
    } else {
        return YES;
    }
}

@end
