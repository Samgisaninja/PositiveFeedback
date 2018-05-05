//
//  InterfaceController.h
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 1/8/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface TimerInterfaceController : WKInterfaceController{
    NSTimeInterval *timeElapsed;
    NSTimer *secondsTimer;
    NSDate *startTime;
    NSDate *relativeStartTime;
    NSString *justInvalidated;
    int intervalsPassed;
}
-(void)update;
-(void)resetTimer;
-(void)prepareAnimation;
@property IBOutlet WKInterfacePicker *progressBarPicker;
-(IBAction)startTimer:(id)sender;
@property IBOutlet WKInterfaceLabel *timerCountSLabel;
@property IBOutlet WKInterfaceLabel *timerCountMLabel;
@property IBOutlet WKInterfaceButton *stopWKInterfaceButton;
@property IBOutlet WKInterfaceButton *startWKInterfaceButton;
@property (strong, nonatomic) IBOutlet WKInterfaceButton *clearWKInterfaceButton;
@property (strong, nonatomic) NSNumber *goalMinutes;
@property (strong, nonatomic) NSNumber *goalSeconds;
@property (strong, nonatomic) NSNumber *runDistance;
@property float goalTime;
@property float goalInterval;
@end
