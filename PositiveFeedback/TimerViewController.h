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
    NSTimeInterval *timeElapsed;
    NSTimer *secondsTimer;
    NSDate *startTime;
    IBOutlet UIButton *startUIButton;
    NSString *justInvalidated;
}
-(void)update;
@property (strong, nonatomic) IBOutlet UILabel *releaseHintLabel;
-(IBAction)startTimer:(id)sender;
-(IBAction)resetTimer:(id)sender;

@end


