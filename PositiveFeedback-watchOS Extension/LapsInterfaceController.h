//
//  LapsInterfaceController.h
//  PositiveFeedback-watchOS Extension
//
//  Created by Sam Gardner on 8/26/18.
//  Copyright © 2018 Sam Gardner. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface LapsInterfaceController : WKInterfaceController
@property (strong, nonatomic) NSNumber *runDistance;
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *runDistanceLabel;

@end

