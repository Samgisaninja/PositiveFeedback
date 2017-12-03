//
//  ViewController.h
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
    IBOutlet UILabel *timerCountSLabel;
    IBOutlet UILabel *timerCountMLabel;
    NSTimeInterval *timerCountS;
    NSInteger *timerCountMInt;
    NSTimer *secondsTimer;
    NSTimer *minutesTimer;
    NSDate *startTime;
    NSDate *relativeStartTime;
}
@property (weak, nonatomic) IBOutlet UIPickerView *goalTimePicker;
-(void)updateSeconds;
-(void)updateMinutes;
-(IBAction)startTimer:(id)sender;
-(IBAction)stopTimer:(id)sender;
-(IBAction)resetTimer:(id)sender;

@end

