//
//  LapsViewController.h
//  PositiveFeedback
//
//  Created by Sam Gardner on 2/7/19.
//  Copyright © 2019 Sam Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LapsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *plusButton;
@property (strong, nonatomic) IBOutlet UIButton *minusButton;
@property (strong, nonatomic) IBOutlet UILabel *runDistanceLabel;
@property (strong, nonatomic) NSNumber *runDistance;

@end
