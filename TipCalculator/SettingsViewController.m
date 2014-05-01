//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Kevin Farst on 4/30/14.
//  Copyright (c) 2014 Kevin Farst. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *smallestTipPercentage;
@property (weak, nonatomic) IBOutlet UITextField *middleTipPercentage;
@property (weak, nonatomic) IBOutlet UITextField *largestTipPercentage;
@property (strong, nonatomic) NSArray *tipSegments;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *onTap;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
        self.tipSegments = @[@"smallestTipPercentage", @"middleTipPercentage", @"largestTipPercentage"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [self.tipSegments enumerateObjectsUsingBlock:^(id segment, NSUInteger idx, BOOL *stop) {
        float percentage = [defaults floatForKey:segment];
        UITextField *prop = [self valueForKey:self.tipSegments[idx]];
        
        if (percentage) {
            prop.text = [NSString stringWithFormat:@"%0.0f", percentage * 100];
        } else {
            prop.text = [NSString stringWithFormat:@"%0.0f", [self.defaultTipValues[idx] floatValue] * 100];
        }
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self savePercentage];
}

- (void)savePercentage {
    // save the new value
}

@end
