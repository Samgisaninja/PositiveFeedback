//
//  TimerViewController.h
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TimerViewController : UIViewController{
    IBOutlet UILabel *timerCountSLabel;
    IBOutlet UILabel *timerCountMLabel;
    NSTimeInterval *timerCountS;
    NSInteger *timerCountMInt;
    NSTimer *secondsTimer;
    NSTimer *minutesTimer;
    NSDate *startTime;
    NSDate *relativeStartTime;    
    IBOutlet UIButton *startUIButton;
    NSString *justInvalidated;
    long *timerCountMIntDivided;
}
-(void)updateSeconds;
-(void)updateMinutes;
@property (strong, nonatomic) IBOutlet UILabel *releaseHintLabel;
-(IBAction)startTimer:(id)sender;
-(IBAction)resetTimer:(id)sender;

@end


