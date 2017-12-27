//
//  ViewController.h
//  PositiveFeedback
//
//  Created by Sam Gardner on 11/30/17.
//  Copyright © 2017 Sam Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface DistancePickerViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
}
@property (strong, nonatomic) IBOutlet UIPickerView *distancePicker;
@property (strong, nonatomic) NSString *runDistanceString;
@end

