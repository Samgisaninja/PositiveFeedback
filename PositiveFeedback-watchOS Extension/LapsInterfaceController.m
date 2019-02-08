//
//  LapsInterfaceController.m
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 8/26/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import "LapsInterfaceController.h"


@interface LapsInterfaceController (){
    float runDistanceFloat;
}


@end


@implementation LapsInterfaceController

- (void)awakeWithContext:(id)context {
    runDistanceFloat = 4.0;
    _runDistance = @(4.0);
    [[self runDistanceLabel] setText:[NSString stringWithFormat:@"%.f", roundf(runDistanceFloat)]];
}

-(IBAction)plusButton:(id)sender{
    runDistanceFloat = runDistanceFloat + 1.0;
    _runDistance = @(roundf(runDistanceFloat));
    [[self runDistanceLabel] setText:[NSString stringWithFormat:@"%.f", roundf(runDistanceFloat)]];
}

-(IBAction)minusButton:(id)sender{
    runDistanceFloat = runDistanceFloat - 1.0;
    _runDistance = @(roundf(runDistanceFloat));
    [[self runDistanceLabel] setText:[NSString stringWithFormat:@"%.f", roundf(runDistanceFloat)]];
}

-(IBAction)nextButton:(id)sender{
    NSDictionary * goalDataShare = @{@"runDistance" : _runDistance};
    [self pushControllerWithName:@"TimePickerInterfaceController" context:goalDataShare];
}

-(IBAction)fiveKButton:(id)sender{
    _runDistance = @(3.125);
    NSDictionary * goalDataShare = @{@"runDistance" : _runDistance};
    [self pushControllerWithName:@"TimePickerInterfaceController" context:goalDataShare];
}

-(IBAction)endlessButton:(id)sender{
    _runDistance = @(-1.0);
    NSDictionary * goalDataShare = @{@"runDistance" : _runDistance};
    [self pushControllerWithName:@"TimePickerInterfaceController" context:goalDataShare];
}
@end
