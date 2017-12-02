//
//  ViewController.h
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
NSTimeInterval *timerCountS;
NSInteger *timerCountMInt;
@interface ViewController : UIViewController{
    IBOutlet UILabel *timerCountSLabel;
    IBOutlet UILabel *timerCountMLabel;
    
    NSTimer *secondsTimer;
    NSTimer *minutesTimer;
    NSDate *startTime;
}
-(void)updateSeconds;
-(void)updateMinutes;
-(IBAction)startTimer:(id)sender;
-(IBAction)stopTimer:(id)sender;
-(IBAction)resetTimer:(id)sender;

@end

