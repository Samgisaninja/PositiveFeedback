//
//  EndlessInterfaceController.h
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 6/7/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <HealthKit/HKWorkoutSession.h>
#import <HealthKit/HKHealthStore.h>

@interface EndlessInterfaceController : WKInterfaceController{
    NSTimeInterval *timeElapsed;
    NSTimer *secondsTimer;
    NSDate *startTime;
    NSDate *relativeStartTime;
    NSString *justInvalidated;
    int intervalsPassed;
}
@property IBOutlet WKInterfacePicker *progressBarPicker;
@property IBOutlet WKInterfaceLabel *timerCountSLabel;
@property IBOutlet WKInterfaceLabel *timerCountMLabel;
@property IBOutlet WKInterfaceButton *stopWKInterfaceButton;
@property IBOutlet WKInterfaceButton *startWKInterfaceButton;
@property (strong, nonatomic) IBOutlet WKInterfaceButton *clearWKInterfaceButton;
@property (strong, nonatomic) NSNumber *goalMinutes;
@property (strong, nonatomic) NSNumber *goalSeconds;
@property (strong, nonatomic) HKWorkoutConfiguration *runningWorkoutConfig;
@property (strong, nonatomic) HKWorkoutSession *runningWorkout;
@property (strong, nonatomic) HKHealthStore *healthStore;
@property float goalTime;
@property float goalInterval;
@end


