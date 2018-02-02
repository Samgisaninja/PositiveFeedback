//
//  TimePickerInterfaceController.h
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 1/23/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface TimePickerInterfaceController : WKInterfaceController
@property (strong, nonatomic) IBOutlet WKInterfacePicker *minutesPicker;
@property (strong, nonatomic) IBOutlet WKInterfacePicker *secondsPicker;
@property (strong, nonatomic) NSArray *secondsPickerItems;
@property (strong, nonatomic) NSArray *minutesPickerItems;
@property (strong, nonatomic) NSNumber *runDistance;
@property (strong, nonatomic) NSNumber *goalMinutes;
@property (strong, nonatomic) NSNumber *goalSeconds;
@end
