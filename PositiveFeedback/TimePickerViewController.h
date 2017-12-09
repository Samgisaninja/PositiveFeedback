//
//  ViewController.h
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TimePickerViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
}
@property (weak, nonatomic) IBOutlet UIPickerView *goalTimePicker;
@property (strong, nonatomic) NSString *goalMinutes;
@property (strong, nonatomic) NSString *goalSeconds;
@end

