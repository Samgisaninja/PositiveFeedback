//
//  TimerViewController.h
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimePickerViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CircleProgressBar.h"

@interface TimerViewController : UIViewController{
    IBOutlet UILabel *timerCountSLabel;
    IBOutlet UILabel *timerCountMLabel;
    NSTimeInterval *timeElapsed;
    NSTimer *secondsTimer;
    NSDate *startTime;
    NSDate *relativeStartTime;
    IBOutlet UIButton *startUIButton;
    NSString *justInvalidated;
    int intervalsPassed;
}
@property (strong, nonatomic) IBOutlet UILabel *releaseHintLabel;
@property (strong, nonatomic) NSNumber *goalMinutes;
@property (strong, nonatomic) NSNumber *goalSeconds;
@property (strong, nonatomic) NSNumber *runDistance;
@property float goalTime;
@property float goalInterval;
@property (strong, nonatomic) IBOutlet CircleProgressBar *circularProgressBar;

@end
