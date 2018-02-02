//
//  DistancePickerInterfaceController.h
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 1/19/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface DistancePickerInterfaceController : WKInterfaceController
@property (strong, nonatomic) NSNumber *runDistance;
@property (strong, nonatomic) IBOutlet WKInterfacePicker *distancePicker;
@property (strong, nonatomic) NSArray *distancePickerItems;
@end
