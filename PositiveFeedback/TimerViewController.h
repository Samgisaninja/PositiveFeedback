//
//  TimerViewController.h
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimePickerViewController.h"

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
-(void)update;
@property (strong, nonatomic) IBOutlet UILabel *releaseHintLabel;
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
-(IBAction)startTimer:(id)sender;
-(IBAction)resetTimer:(id)sender;
@property (strong, nonatomic) NSNumber *goalMinutes;
@property (strong, nonatomic) NSNumber *goalSeconds;
@property (strong, nonatomic) NSNumber *runDistance;
@property float goalTime;
@property float goalInterval;

@end
