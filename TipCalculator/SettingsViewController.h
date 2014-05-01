//
//  SettingsViewController.h
//  TipCalculator
//
//  Created by Kevin Farst on 4/30/14.
//  Copyright (c) 2014 Kevin Farst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSArray *defaultTipValues;
@property (strong, nonatomic) NSArray *tipSegments;

@end
