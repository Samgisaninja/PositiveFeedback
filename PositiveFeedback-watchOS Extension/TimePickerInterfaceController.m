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
@property (strong, nonatomic) IBOutlet WKInterfacePicker *minutesPicker;
@property (strong, nonatomic) IBOutlet WKInterfacePicker *secondsPicker;
@end

@implementation TimePickerInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSLog(@"%@", _runDistance);
   // NSArray * pickerItems = [self pickerItems];
   // NSLog(@"%@", pickerItems);

}
-(NSMutableArray *)pickerItems{
NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:101];
for(int ctr=0; ctr <= 100; ctr++) {
    WKPickerItem *item = [[WKPickerItem alloc] init];
    NSString *title = [NSString stringWithFormat:@"%d", ctr];
                       item.title = title;
                       [items addObject:item];
                       }
                       return [items copy];
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



