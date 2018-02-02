//
//  DistancePickerInterfaceController.m
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 1/19/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import "DistancePickerInterfaceController.h"

@interface DistancePickerInterfaceController ()


@end

@implementation DistancePickerInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    WKPickerItem *nullPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightHundredMeters = [[WKPickerItem alloc] init];
    WKPickerItem *sixteenHundredMeters = [[WKPickerItem alloc] init];
    WKPickerItem *thirtyTwoHundredMetersEveryMile = [[WKPickerItem alloc] init];
    WKPickerItem *thirtyTwoHundredMetersEveryFourHundred = [[WKPickerItem alloc] init];
    WKPickerItem *fiveThousandMetersEveryMile = [[WKPickerItem alloc] init];
    WKPickerItem *fiveThousandMetersEveryK = [[WKPickerItem alloc] init];
    [nullPickerItem setTitle:@" "];
    [eightHundredMeters setTitle:@"800m (400m)"];
    [sixteenHundredMeters setTitle:@"1600m (400m)"];
    [thirtyTwoHundredMetersEveryMile setTitle:@"3200m (1600m)"];
    [thirtyTwoHundredMetersEveryFourHundred setTitle:@"3200m (400m)"];
    [fiveThousandMetersEveryMile setTitle:@"5K (1 mi)"];
    [fiveThousandMetersEveryK setTitle:@"5K (1K)"];
    _distancePickerItems = [[NSArray alloc] initWithObjects:nullPickerItem, eightHundredMeters, sixteenHundredMeters, thirtyTwoHundredMetersEveryMile, thirtyTwoHundredMetersEveryFourHundred, fiveThousandMetersEveryMile, fiveThousandMetersEveryK, nil];
    [self.distancePicker setItems:self.distancePickerItems];
}
- (IBAction)distancePickerAction:(NSInteger)value {
     switch (value) {
        case 0:
            _runDistance = NULL;
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
            break;
     }
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)nextButton {
    NSDictionary * goalDataShare = @{@"runDistance" : _runDistance};
    [self pushControllerWithName:@"TimePickerInterfaceController" context:goalDataShare];
}


@end



