//
//  TipViewController.h
//  TipCalculator
//
//  Created by Kevin Farst on 4/29/14.
//  Copyright (c) 2014 Kevin Farst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (strong, nonatomic) NSArray *defaultTipValues;

@end
