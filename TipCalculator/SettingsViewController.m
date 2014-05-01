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
@property (strong, nonatomic) UITextField *selectedField;
- (IBAction)onTap:(id)sender;
- (IBAction)onSelect:(UITextField *)sender;
- (void)savePercentage;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
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
    
    self.smallestTipPercentage.delegate = self;
    self.middleTipPercentage.delegate = self;
    self.largestTipPercentage.delegate = self;
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

- (IBAction)onSelect:(UITextField *)sender {
    self.selectedField = sender;
}

- (void)savePercentage {
    float enteredPercentage = [self.selectedField.text floatValue] * 0.01;
    
    if (enteredPercentage != [self.defaultTipValues[self.selectedField.tag] floatValue] && enteredPercentage != 0.0) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setFloat:enteredPercentage forKey:self.tipSegments[self.selectedField.tag]];
        [defaults synchronize];
        
    } else {
        self.selectedField.text = [NSString stringWithFormat:@"%d", (int)([self.defaultTipValues[self.selectedField.tag] floatValue] * 100)];
    }

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length >= 2 && range.length == 0)
        return NO;
    return YES;
}

@end
