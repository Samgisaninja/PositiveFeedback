//
//  EndlessViewController.h
//  PositiveFeedback
//
//  Created by Sam Gardner on 6/7/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CircleProgressBar.h"

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
@property (strong, nonatomic) IBOutlet UILabel *releaseHintLabel;
@property (strong, nonatomic) IBOutlet CircleProgressBar *circularProgressBar;
@property (strong, nonatomic) NSNumber *goalMinutes;
@property (strong, nonatomic) NSNumber *goalSeconds;
@property float goalTime;
@end

NS_ASSUME_NONNULL_END
