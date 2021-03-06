//
//  TipViewController.m
//  TipCalculator
//
//  Created by Kevin Farst on 4/29/14.
//  Copyright (c) 2014 Kevin Farst. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"


@interface TipViewController ()

- (IBAction)onTap:(id)sender;
- (void) updateValues;

@property (strong, nonatomic) NSMutableArray *tipValues;
@property (strong, nonatomic) NSArray *tipSegments;
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
        backButton.title = @"Back";
        self.navigationItem.backBarButtonItem = backButton;
        
        self.tipSegments = @[@"smallestTipPercentage", @"middleTipPercentage", @"largestTipPercentage"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.tipValues = [[NSMutableArray alloc] init];

    [self.tipSegments enumerateObjectsUsingBlock:^(id segment, NSUInteger idx, BOOL *stop) {
        float percentage = (float)[defaults floatForKey:segment];
        
        if (percentage) {
            [self.tipValues addObject:@(percentage)];
        } else {
            [self.tipValues addObject:self.defaultTipValues[idx]];
        }
        int labelForSegment = (int)([self.tipValues[idx] floatValue] * 100);
        [self.tipControl setTitle:[NSString stringWithFormat:@"%d%%", labelForSegment] forSegmentAtIndex:idx];
    }];
    
    [self updateValues];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billAmount.text floatValue];
    float tipAmount;
    float totalAmount;
    
    if (self.tipValues.count) {
        tipAmount = billAmount * [self.tipValues[self.tipControl.selectedSegmentIndex] floatValue];
        totalAmount = billAmount + tipAmount;
    } else {
        tipAmount = 0.0;
        totalAmount = 0.0;
    }

    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)onSettingsButton {
    SettingsViewController *settingsController = [[SettingsViewController alloc] init];
    settingsController.defaultTipValues = self.defaultTipValues;
    settingsController.tipSegments = self.tipSegments;
    [self.navigationController pushViewController:settingsController animated:YES];
}
@end
