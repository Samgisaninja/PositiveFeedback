//
//  InterfaceController.h
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 1/8/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController{
    NSTimeInterval *timeElapsed;
    NSTimer *secondsTimer;
    NSDate *startTime;
    NSDate *relativeStartTime;
    IBOutlet WKInterfaceButton *startWKInterfaceButton;
    NSString *justInvalidated;
    int intervalsPassed;
}
-(void)update;
-(void)resetTimer;
// @property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
-(IBAction)startTimer:(id)sender;
@property IBOutlet WKInterfaceLabel *timerCountSLabel;
@property IBOutlet WKInterfaceLabel *timerCountMLabel;
@property (strong, nonatomic) NSNumber *goalMinutes;
@property (strong, nonatomic) NSNumber *goalSeconds;
@property (strong, nonatomic) NSNumber *runDistance;
@property float goalTime;
@property float goalInterval;
@end
