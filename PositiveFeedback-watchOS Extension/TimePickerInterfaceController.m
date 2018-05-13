//
//  TimePickerInterfaceController.m
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 1/23/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import "TimePickerInterfaceController.h"
#import "DistancePickerInterfaceController.h"

@interface TimePickerInterfaceController ()

@end

@implementation TimePickerInterfaceController


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    _runDistance = [context objectForKey:@"runDistance"];
    _goalMinutes = 0;
    _goalSeconds = 0;
    //Guess who's too lazy to learn for statements?
    WKPickerItem *nullPickerItem = [[WKPickerItem alloc] init];
    [nullPickerItem setTitle:@" "];
    WKPickerItem * zeroItem = [[WKPickerItem alloc] init];
    [zeroItem setTitle:@"00"];
    WKPickerItem * oneItem = [[WKPickerItem alloc] init];
    [oneItem setTitle:@"01"];
    WKPickerItem * twoItem = [[WKPickerItem alloc] init];
    [twoItem setTitle:@"02"];
    WKPickerItem * threeItem = [[WKPickerItem alloc] init];
    [threeItem setTitle:@"03"];
    WKPickerItem * fourItem = [[WKPickerItem alloc] init];
    [fourItem setTitle:@"04"];
    WKPickerItem * fiveItem = [[WKPickerItem alloc] init];
    [fiveItem setTitle:@"05"];
    WKPickerItem * sixItem = [[WKPickerItem alloc] init];
    [sixItem setTitle:@"06"];
    WKPickerItem * sevenItem = [[WKPickerItem alloc] init];
    [sevenItem setTitle:@"07"];
    WKPickerItem * eightItem = [[WKPickerItem alloc] init];
    [eightItem setTitle:@"08"];
    WKPickerItem * nineItem = [[WKPickerItem alloc] init];
    [nineItem setTitle:@"09"];
    WKPickerItem * tenItem = [[WKPickerItem alloc] init];
    [tenItem setTitle:@"10"];
    WKPickerItem * elevenItem = [[WKPickerItem alloc] init];
    [elevenItem setTitle:@"11"];
    WKPickerItem * twelveItem = [[WKPickerItem alloc] init];
    [twelveItem setTitle:@"12"];
    WKPickerItem * thirteenItem = [[WKPickerItem alloc] init];
    [thirteenItem setTitle:@"13"];
    WKPickerItem * fourteenItem = [[WKPickerItem alloc] init];
    [fourteenItem setTitle:@"14"];
    WKPickerItem * fifteenItem = [[WKPickerItem alloc] init];
    [fifteenItem setTitle:@"15"];
    WKPickerItem * sixteenItem = [[WKPickerItem alloc] init];
    [sixteenItem setTitle:@"16"];
    WKPickerItem * seventeenItem = [[WKPickerItem alloc] init];
    [seventeenItem setTitle:@"17"];
    WKPickerItem * eighteenItem = [[WKPickerItem alloc] init];
    [eighteenItem setTitle:@"18"];
    WKPickerItem * nineteenItem = [[WKPickerItem alloc] init];
    [nineteenItem setTitle:@"19"];
    WKPickerItem * twentyItem = [[WKPickerItem alloc] init];
    [twentyItem setTitle:@"20"];
    WKPickerItem * twentyOneItem = [[WKPickerItem alloc] init];
    [twentyOneItem setTitle:@"21"];
    WKPickerItem * twentyTwoItem = [[WKPickerItem alloc] init];
    [twentyTwoItem setTitle:@"22"];
    WKPickerItem * twentyThreeItem = [[WKPickerItem alloc] init];
    [twentyThreeItem setTitle:@"23"];
    WKPickerItem * twentyFourItem = [[WKPickerItem alloc] init];
    [twentyFourItem setTitle:@"24"];
    WKPickerItem * twentyFiveItem = [[WKPickerItem alloc] init];
    [twentyFiveItem setTitle:@"25"];
    WKPickerItem * twentySixItem = [[WKPickerItem alloc] init];
    [twentySixItem setTitle:@"26"];
    WKPickerItem * twentySevenItem = [[WKPickerItem alloc] init];
    [twentySevenItem setTitle:@"27"];
    WKPickerItem * twentyEightItem = [[WKPickerItem alloc] init];
    [twentyEightItem setTitle:@"28"];
    WKPickerItem * twentyNineItem = [[WKPickerItem alloc] init];
    [twentyNineItem setTitle:@"29"];
    WKPickerItem * thirtyItem = [[WKPickerItem alloc] init];
    [thirtyItem setTitle:@"30"];
    WKPickerItem * thirtyOneItem = [[WKPickerItem alloc] init];
    [thirtyOneItem setTitle:@"31"];
    WKPickerItem * thirtyTwoItem = [[WKPickerItem alloc] init];
    [thirtyTwoItem setTitle:@"32"];
    WKPickerItem * thirtyThreeItem = [[WKPickerItem alloc] init];
    [thirtyThreeItem setTitle:@"33"];
    WKPickerItem * thirtyFourItem = [[WKPickerItem alloc] init];
    [thirtyFourItem setTitle:@"34"];
    WKPickerItem * thirtyFiveItem = [[WKPickerItem alloc] init];
    [thirtyFiveItem setTitle:@"35"];
    WKPickerItem * thirtySixItem = [[WKPickerItem alloc] init];
    [thirtySixItem setTitle:@"36"];
    WKPickerItem * thirtySevenItem = [[WKPickerItem alloc] init];
    [thirtySevenItem setTitle:@"37"];
    WKPickerItem * thirtyEightItem = [[WKPickerItem alloc] init];
    [thirtyEightItem setTitle:@"38"];
    WKPickerItem * thirtyNineItem = [[WKPickerItem alloc] init];
    [thirtyNineItem setTitle:@"39"];
    WKPickerItem * fortyItem = [[WKPickerItem alloc] init];
    [fortyItem setTitle:@"40"];
    WKPickerItem * fortyOneItem = [[WKPickerItem alloc] init];
    [fortyOneItem setTitle:@"41"];
    WKPickerItem * fortyTwoItem = [[WKPickerItem alloc] init];
    [fortyTwoItem setTitle:@"42"];
    WKPickerItem * fortyThreeItem = [[WKPickerItem alloc] init];
    [fortyThreeItem setTitle:@"43"];
    WKPickerItem * fortyFourItem = [[WKPickerItem alloc] init];
    [fortyFourItem setTitle:@"44"];
    WKPickerItem * fortyFiveItem = [[WKPickerItem alloc] init];
    [fortyFiveItem setTitle:@"45"];
    WKPickerItem * fortySixItem = [[WKPickerItem alloc] init];
    [fortySixItem setTitle:@"46"];
    WKPickerItem * fortySevenItem = [[WKPickerItem alloc] init];
    [fortySevenItem setTitle:@"47"];
    WKPickerItem * fortyEightItem = [[WKPickerItem alloc] init];
    [fortyEightItem setTitle:@"48"];
    WKPickerItem * fortyNineItem = [[WKPickerItem alloc] init];
    [fortyNineItem setTitle:@"49"];
    WKPickerItem * fiftyItem = [[WKPickerItem alloc] init];
    [fiftyItem setTitle:@"50"];
    WKPickerItem * fiftyOneItem = [[WKPickerItem alloc] init];
    [fiftyOneItem setTitle:@"51"];
    WKPickerItem * fiftyTwoItem = [[WKPickerItem alloc] init];
    [fiftyTwoItem setTitle:@"52"];
    WKPickerItem * fiftyThreeItem = [[WKPickerItem alloc] init];
    [fiftyThreeItem setTitle:@"53"];
    WKPickerItem * fiftyFourItem = [[WKPickerItem alloc] init];
    [fiftyFourItem setTitle:@"54"];
    WKPickerItem * fiftyFiveItem = [[WKPickerItem alloc] init];
    [fiftyFiveItem setTitle:@"55"];
    WKPickerItem * fiftySixItem = [[WKPickerItem alloc] init];
    [fiftySixItem setTitle:@"56"];
    WKPickerItem * fiftySevenItem = [[WKPickerItem alloc] init];
    [fiftySevenItem setTitle:@"57"];
    WKPickerItem * fiftyEightItem = [[WKPickerItem alloc] init];
    [fiftyEightItem setTitle:@"58"];
    WKPickerItem * fiftyNineItem = [[WKPickerItem alloc] init];
    [fiftyNineItem setTitle:@"59"];
    _secondsPickerItems = [[NSArray alloc] initWithObjects:nullPickerItem, zeroItem, oneItem, twoItem, threeItem, fourItem, fiveItem, sixItem, sevenItem, eightItem, nineItem, tenItem, elevenItem, twelveItem, thirteenItem, fourteenItem, fifteenItem, sixteenItem, seventeenItem, eighteenItem, nineteenItem, twentyItem, twentyOneItem, twentyTwoItem, twentyTwoItem, twentyThreeItem, twentyFourItem, twentyFiveItem, twentySixItem, twentySevenItem, twentyEightItem, twentyNineItem, thirtyItem, thirtyOneItem, thirtyTwoItem, thirtyThreeItem, thirtyFourItem, thirtyFiveItem, thirtySixItem, thirtySevenItem, thirtyEightItem, thirtyNineItem, fortyItem, fortyOneItem, fortyTwoItem, fortyThreeItem, fortyFourItem, fortyFiveItem, fortySixItem, fortySevenItem, fortyEightItem, fortyNineItem, fiftyItem, fiftyOneItem, fiftyTwoItem, fiftyThreeItem, fiftyFourItem, fiftyFiveItem, fiftySixItem, fiftySevenItem, fiftyEightItem, fiftyNineItem, nil];
    [self.secondsPicker setItems:_secondsPickerItems];
    _minutesPickerItems = [[NSArray alloc] initWithObjects:nullPickerItem, zeroItem, oneItem, twoItem, threeItem, fourItem, fiveItem, sixItem, sevenItem, eightItem, nineItem, tenItem, elevenItem, twelveItem, thirteenItem, fourteenItem, fifteenItem, sixteenItem, seventeenItem, eighteenItem, nineteenItem, twentyItem, twentyOneItem, twentyTwoItem, twentyTwoItem, twentyThreeItem, twentyFourItem, twentyFiveItem, twentySixItem, twentySevenItem, twentyEightItem, twentyNineItem, thirtyItem, nil];
    [self.minutesPicker setItems:_minutesPickerItems];
    [_secondsPicker setSelectedItemIndex:1];
    [_minutesPicker setSelectedItemIndex:1];
    //Sorry.
}

- (IBAction)minutesPickerAction:(NSInteger)value {
    value = value - 1;
    _goalMinutes = [NSNumber numberWithInteger:value];
}
- (IBAction)secondsPickerAction:(NSInteger)value {
    value = value - 1;
    _goalSeconds = [NSNumber numberWithInteger:value];
}

- (IBAction)nextButton {
    NSDictionary * goalDataShare = @{@"runDistance" : _runDistance, @"goalMinutes": _goalMinutes, @"goalSeconds": _goalSeconds};
        [self pushControllerWithName:@"TimerInterfaceController" context:goalDataShare];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



