//
//  EndlessInterfaceController.m
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 6/7/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import "EndlessInterfaceController.h"
#import <HealthKit/HKWorkoutSession.h>
#import <HealthKit/HKHealthStore.h>

@interface EndlessInterfaceController ()

@end

@implementation EndlessInterfaceController

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
    _goalMinutes = [context objectForKey:@"goalMinutes"];
    _goalSeconds = [context objectForKey:@"goalSeconds"];
    _goalTime = [_goalSeconds floatValue] + [_goalMinutes floatValue] * 60;
    [self prepareAnimation];
    [_progressBarPicker setSelectedItemIndex:0];
    [_progressBarPicker setHidden:TRUE];
    _runningWorkoutConfig = [[HKWorkoutConfiguration alloc] init];
    _runningWorkoutConfig.activityType = HKWorkoutActivityTypeRunning;
    _runningWorkoutConfig.locationType = HKWorkoutSessionLocationTypeOutdoor;
    _runningWorkout = [[HKWorkoutSession alloc] initWithConfiguration:_runningWorkoutConfig error:nil];
    _healthStore = [HKHealthStore new];
    UIFont *systemFont = [UIFont systemFontOfSize:35];
    UIFontDescriptor *monospacedNumberFontDescriptor = [systemFont.fontDescriptor fontDescriptorByAddingAttributes: @{
                                                                                                                      UIFontDescriptorFeatureSettingsAttribute: @[@{
                                                                                                                                                                      UIFontFeatureTypeIdentifierKey: @6,
                                                                                                                                                                      UIFontFeatureSelectorIdentifierKey: @0
                                                                                                                                                                      }]
                                                                                                                      }];
    _monospacedNumberSystemFont = [UIFont fontWithDescriptor:monospacedNumberFontDescriptor size:0];
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
}

-(void)update{
    NSTimeInterval currentUnixTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timeElapsed = currentUnixTime - [startTime timeIntervalSince1970];
    NSInteger timeElapsedInteger = timeElapsed;
    NSInteger minutesElapsed = (timeElapsedInteger / 60) % 60;
    NSTimeInterval secondsElapsed = timeElapsed - 60 * minutesElapsed;
    if (secondsElapsed < 10) {
        NSMutableAttributedString *timerCountSLabelText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"0%.2f", secondsElapsed]];
        [timerCountSLabelText addAttribute:NSFontAttributeName value:_monospacedNumberSystemFont range:NSMakeRange(0, timerCountSLabelText.string.length)];
        [_timerCountSLabel setAttributedText:timerCountSLabelText];
    } else {
        NSMutableAttributedString *timerCountSLabelText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.2f", secondsElapsed]];
        [timerCountSLabelText addAttribute:NSFontAttributeName value:_monospacedNumberSystemFont range:NSMakeRange(0, timerCountSLabelText.string.length)];
        [_timerCountSLabel setAttributedText:timerCountSLabelText];
    }
    if (minutesElapsed < 10) {
        NSMutableAttributedString *timerCountMLabelText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"0%.1ld",(long)minutesElapsed]];
        [timerCountMLabelText addAttribute:NSFontAttributeName value:_monospacedNumberSystemFont range:NSMakeRange(0, timerCountMLabelText.string.length)];
        [_timerCountMLabel setAttributedText:timerCountMLabelText];
    } else {
        NSMutableAttributedString *timerCountMLabelText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.1ld",(long)minutesElapsed]];
        [timerCountMLabelText addAttribute:NSFontAttributeName value:_monospacedNumberSystemFont range:NSMakeRange(0, timerCountMLabelText.string.length)];
        [_timerCountMLabel setAttributedText:timerCountMLabelText];
    }
    float progressToInterval = currentUnixTime - [relativeStartTime timeIntervalSince1970];
    if (progressToInterval > _goalTime) {
        relativeStartTime = [NSDate date];
        intervalsPassed = intervalsPassed + 1;
        [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeFailure];
    }
    float percentProgressToGoal = progressToInterval / _goalTime;
    percentProgressToGoal = percentProgressToGoal * 100;
    NSInteger percentProgressToGoalInt = (NSInteger) roundf(percentProgressToGoal);
    [_progressBarPicker setSelectedItemIndex:percentProgressToGoalInt];
}
-(IBAction)startTimer:(id)sender{
    startTime = [NSDate date];
    relativeStartTime = [NSDate date];
    timeElapsed = 0;
    secondsTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(update) userInfo:nil repeats:YES];
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeDirectionDown];
    [_startWKInterfaceButton setHidden:TRUE];
    [_stopWKInterfaceButton setHidden:FALSE];
    [_clearWKInterfaceButton setHidden:TRUE];
    [_progressBarPicker setHidden:FALSE];
    [_healthStore startWorkoutSession:_runningWorkout];
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
    [_healthStore endWorkoutSession:_runningWorkout];
    _healthStore = nil;
    _runningWorkout = nil;
    _runningWorkout = [[HKWorkoutSession alloc] initWithConfiguration:_runningWorkoutConfig error:nil];
    _healthStore = [HKHealthStore new];
    
}
-(void)prepareAnimation{
    WKPickerItem *zeroPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *onePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twoPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *threePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fourPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fivePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sevenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *ninePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *tenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *elevenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *twelvePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *thirteenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fourteenPickerItem = [[WKPickerItem alloc] init];
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
    WKPickerItem *fortyPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fortyOnePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fortyTwoPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fortyThreePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fortyFourPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fortyFivePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fortySixPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fortySevenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fortyEightPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fortyNinePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fiftyPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fiftyOnePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fiftyTwoPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fiftyThreePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fiftyFourPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fiftyFivePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fiftySixPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fiftySevenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fiftyEightPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *fiftyNinePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixtyPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixtyOnePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixtyTwoPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixtyThreePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixtyFourPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixtyFivePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixtySixPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixtySevenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixtyEightPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *sixtyNinePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *seventyPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *seventyOnePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *seventyTwoPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *seventyThreePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *seventyFourPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *seventyFivePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *seventySixPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *seventySevenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *seventyEightPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *seventyNinePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightyPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightyOnePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightyTwoPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightyThreePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightyFourPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightyFivePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightySixPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightySevenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightyEightPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *eightyNinePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *ninetyPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *ninetyOnePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *ninetyTwoPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *ninetyThreePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *ninetyFourPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *ninetyFivePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *ninetySixPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *ninetySevenPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *ninetyEightPickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *ninetyNinePickerItem = [[WKPickerItem alloc] init];
    WKPickerItem *oneHundredPickerItem = [[WKPickerItem alloc] init];
    
    NSArray *pickerItems = [[NSArray alloc] initWithObjects:zeroPickerItem, onePickerItem, twoPickerItem, threePickerItem, fourPickerItem, fivePickerItem, sixPickerItem, sevenPickerItem, eightPickerItem, ninePickerItem, tenPickerItem, elevenPickerItem, twelvePickerItem, thirteenPickerItem, fourteenPickerItem, fifteenPickerItem, sixteenPickerItem, seventeenPickerItem, eighteenPickerItem, nineteenPickerItem, twentyPickerItem, twentyOnePickerItem, twentyTwoPickerItem, twentyThreePickerItem, twentyFourPickerItem, twentyFivePickerItem, twentySixPickerItem, twentySevenPickerItem, twentyEightPickerItem, twentyNinePickerItem, thirtyPickerItem, thirtyOnePickerItem, thirtyTwoPickerItem, thirtyThreePickerItem, thirtyFourPickerItem, thirtyFourPickerItem, thirtyFivePickerItem, thirtySixPickerItem, thirtySevenPickerItem, thirtyEightPickerItem, thirtyNinePickerItem, fortyPickerItem, fortyOnePickerItem, fortyTwoPickerItem, fortyThreePickerItem,fortyFourPickerItem,fortyFivePickerItem, fortySixPickerItem, fortySevenPickerItem, fortyEightPickerItem, fortyNinePickerItem, fiftyPickerItem, fiftyOnePickerItem, fiftyTwoPickerItem, fiftyThreePickerItem, fiftyFourPickerItem, fiftyFivePickerItem, fiftySixPickerItem, fiftySevenPickerItem, fiftyEightPickerItem,fiftyNinePickerItem, sixtyPickerItem, sixtyOnePickerItem,sixtyTwoPickerItem, sixtyThreePickerItem, sixtyFourPickerItem, sixtyFivePickerItem, sixtySixPickerItem, sixtySevenPickerItem, sixtyEightPickerItem, sixtyNinePickerItem, seventyPickerItem, seventyOnePickerItem, seventyTwoPickerItem, seventyThreePickerItem, seventyFourPickerItem, seventyFivePickerItem, seventySixPickerItem, seventySevenPickerItem, seventyEightPickerItem, seventyNinePickerItem, eightyPickerItem, eightyOnePickerItem, eightyTwoPickerItem, eightyThreePickerItem, eightyFourPickerItem, eightyFivePickerItem, eightySixPickerItem, eightySevenPickerItem, eightyEightPickerItem, eightyNinePickerItem, ninetyPickerItem, ninetyOnePickerItem, ninetyTwoPickerItem, ninetyThreePickerItem, ninetyFourPickerItem, ninetyFivePickerItem, ninetySixPickerItem, ninetySevenPickerItem, ninetyEightPickerItem, ninetyNinePickerItem, oneHundredPickerItem, nil];
    for (int i=0; i<=100; i++) {
        [[pickerItems objectAtIndex:i] setContentImage:[WKImage imageWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i]]]];
    }
    [self.progressBarPicker setItems:pickerItems];
}
@end
