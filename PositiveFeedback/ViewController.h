//
//  ViewController.h
//  stopwatchtest
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
NSTimeInterval *timerCount;
@interface ViewController : UIViewController{
    IBOutlet UILabel *timerCountLabel;
    
    NSTimer *timer;
    NSDate *startTime;
}
-(void)updateLabel;
-(IBAction)startTimer:(id)sender;
-(IBAction)stopTimer:(id)sender;
-(IBAction)resetTimer:(id)sender;

@end

