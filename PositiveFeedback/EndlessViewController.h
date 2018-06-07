//
//  EndlessViewController.h
//  PositiveFeedback
//
//  Created by Sam Gardner on 6/7/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EndlessViewController : UIViewController{
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
-(void)resetTimer;
@property (strong, nonatomic) IBOutlet UILabel *releaseHintLabel;
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
-(IBAction)startTimer:(id)sender;
-(IBAction)clearTimer:(id)sender;
@property (strong, nonatomic) NSNumber *goalMinutes;
@property (strong, nonatomic) NSNumber *goalSeconds;
@property float goalTime;
@end

NS_ASSUME_NONNULL_END
