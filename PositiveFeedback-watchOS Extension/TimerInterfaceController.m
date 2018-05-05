//
//  InterfaceController.m
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 1/8/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import "TimerInterfaceController.h"


@interface TimerInterfaceController ()

@end


@implementation TimerInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    //viewDidntLoad!
    _timerCountMLabel.text = [NSString stringWithFormat:@"00"];
    _timerCountSLabel.text = [NSString stringWithFormat:@"00.00"];
    [_startWKInterfaceButton setHidden:FALSE];
    [_stopWKInterfaceButton setHidden:TRUE];
    [_clearWKInterfaceButton setHidden:TRUE];
    timeElapsed = 0;
    intervalsPassed = 0;
    _runDistance = [context objectForKey:@"runDistance"];
    _goalMinutes = [context objectForKey:@"goalMinutes"];
    _goalSeconds = [context objectForKey:@"goalSeconds"];
    _goalTime = [_goalSeconds floatValue] + [_goalMinutes floatValue] * 60;
    _goalInterval = _goalTime / [_runDistance floatValue];
    [self prepareAnimation];
    [_progressBarPicker setSelectedItemIndex:0];
    [_progressBarPicker setHidden:TRUE];
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
}

-(void)update{
    NSTimeInterval currentUnixTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timeElapsed = currentUnixTime - [startTime timeIntervalSince1970];
    NSInteger timeElapsedInteger = timeElapsed;
    NSInteger minutesElapsed = (timeElapsedInteger / 60) % 60;
    NSTimeInterval secondsElapsed = timeElapsed - 60 * minutesElapsed;
    if (secondsElapsed < 10) {
        _timerCountSLabel.text = [NSString stringWithFormat:@"0%.2f",secondsElapsed];
    } else {
        _timerCountSLabel.text = [NSString stringWithFormat:@"%.2f",secondsElapsed];
    }
    if (minutesElapsed < 10) {
        _timerCountMLabel.text = [NSString stringWithFormat:@"0%.1ld",(long)minutesElapsed];
    } else {
        _timerCountMLabel.text = [NSString stringWithFormat:@"%.1ld",(long)minutesElapsed];
    }
    float progressToInterval = currentUnixTime - [relativeStartTime timeIntervalSince1970];
    if (progressToInterval > _goalInterval) {
        relativeStartTime = [NSDate date];
        intervalsPassed = intervalsPassed + 1;
        [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeFailure];
    }
    float percentProgressToGoal = timeElapsed / _goalTime;
    percentProgressToGoal = percentProgressToGoal * 100;
    NSInteger percentProgressToGoalInt = (NSInteger) roundf(percentProgressToGoal);
    [_progressBarPicker setSelectedItemIndex:percentProgressToGoalInt];
    if (timeElapsed > _goalTime) {
        [secondsTimer invalidate];
        [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeStop];
        [_startWKInterfaceButton setHidden:TRUE];
        [_stopWKInterfaceButton setHidden:TRUE];
        [_clearWKInterfaceButton setHidden:FALSE];
    }
}
-(IBAction)startTimer:(id)sender{
    startTime = [NSDate date];
    relativeStartTime = [NSDate date];
    timeElapsed = 0;
    secondsTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeDirectionDown];
    [_startWKInterfaceButton setHidden:TRUE];
    [_stopWKInterfaceButton setHidden:FALSE];
    [_clearWKInterfaceButton setHidden:TRUE];
    [_progressBarPicker setHidden:FALSE];
}

- (IBAction)stopTimer:(id)sender {
    [secondsTimer fire];
    [secondsTimer invalidate];
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeStop];
    [_startWKInterfaceButton setHidden:TRUE];
    [_stopWKInterfaceButton setHidden:TRUE];
    [_clearWKInterfaceButton setHidden:FALSE];
}
- (IBAction)clearTimer:(id)sender {
    [self resetTimer];
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeClick];
    [_clearWKInterfaceButton setHidden:TRUE];
    [_stopWKInterfaceButton setHidden:TRUE];
    [_startWKInterfaceButton setHidden:FALSE];
    [_progressBarPicker setHidden:TRUE];
    
}
-(void)resetTimer{
    [secondsTimer invalidate];
    timeElapsed = 0;
    _timerCountSLabel.text = [NSString stringWithFormat:@"00.00"];
    _timerCountMLabel.text = [NSString stringWithFormat:@"00"];
    [_progressBarPicker setSelectedItemIndex:0];
}
-(void)prepareAnimation{
    WKPickerItem *zeroPickerItem = [[WKPickerItem alloc] init];
    zeroPickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"0.png"]];
    WKPickerItem *onePickerItem = [[WKPickerItem alloc] init];
    onePickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"1.png"]];
    WKPickerItem *twoPickerItem = [[WKPickerItem alloc] init];
    twoPickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"2.png"]];
    WKPickerItem *threePickerItem = [[WKPickerItem alloc] init];
    threePickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"3.png"]];
    /*WKPickerItem *fourPickerItem = [[WKPickerItem alloc] init];
    fourPickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"4.png"]];
    WKPickerItem *fivePickerItem = [[WKPickerItem alloc] init];
    fivePickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"5.png"]];
    WKPickerItem *sixPickerItem = [[WKPickerItem alloc] init];
    sixPickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"6.png"]];
    WKPickerItem *sevenPickerItem = [[WKPickerItem alloc] init];
    sevenPickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"7.png"]];
    WKPickerItem *eightPickerItem = [[WKPickerItem alloc] init];
    eightPickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"8.png"]];
    WKPickerItem *ninePickerItem = [[WKPickerItem alloc] init];
    ninePickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"9.png"]];
    WKPickerItem *tenPickerItem = [[WKPickerItem alloc] init];
    tenPickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"10.png"]];
    WKPickerItem *elevenPickerItem = [[WKPickerItem alloc] init];
    elevenPickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"11.png"]];
    WKPickerItem *twelvePickerItem = [[WKPickerItem alloc] init];
    twelvePickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"12.png"]];
    WKPickerItem *thirteenPickerItem = [[WKPickerItem alloc] init];
    thirteenPickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"13.png"]];
    WKPickerItem *fourteenPickerItem = [[WKPickerItem alloc] init];
    fourteenPickerItem.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"14.png"]];
    WKPickerItem *fifteenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixteenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *seventeenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eighteenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *nineteenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twentyPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twentyOnePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twentyTwoPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twentyThreePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twentyFourPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twentyFivePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twentySixPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twentySevenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twentyEightPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twentyNinePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *thirtyPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *thirtyOnePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *thirtyTwoPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *thirtyThreePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *thirtyFourPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *thirtyFivePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *thirtySixPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *thirtySevenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *thirtyEightPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *thirtyNinePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fortyPickerItem = [[WKPickerItem alloc] init];*/
    NSArray *pickerItems = [[NSArray alloc] initWithObjects:zeroPickerItem, onePickerItem, twoPickerItem, threePickerItem,/* fourPickerItem, fivePickerItem, sixPickerItem, sevenPickerItem, eightPickerItem, ninePickerItem, tenPickerItem, elevenPickerItem, twelvePickerItem, thirteenPickerItem, fourteenPickerItem, fifteenPickerItem, sixteenPickerItem, seventeenPickerItem, eighteenPickerItem, nineteenPickerItem, twentyPickerItem, twentyOnePickerItem, twentyTwoPickerItem, twentyThreePickerItem, twentyFourPickerItem, twentyFivePickerItem, twentySixPickerItem, twentySevenPickerItem, twentyEightPickerItem, twentyNinePickerItem, thirtyPickerItem, thirtyOnePickerItem, thirtyTwoPickerItem, thirtyThreePickerItem, thirtyFourPickerItem, thirtyFourPickerItem, thirtyFivePickerItem, thirtySixPickerItem, thirtySevenPickerItem, thirtyEightPickerItem, thirtyNinePickerItem, fortyPickerItem,*/ nil];
    [self.progressBarPicker setItems:pickerItems];
}
@end



