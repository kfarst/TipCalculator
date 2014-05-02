//
//  TipCalculatorTests.m
//  TipCalculatorTests
//
//  Created by Kevin Farst on 4/29/14.
//  Copyright (c) 2014 Kevin Farst. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>
#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipCalculatorTests : XCTestCase

@end

@implementation TipCalculatorTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTipCalculatorTitleIsSet
{
    TipViewController *tipVC = [[TipViewController alloc] init];
    XCTAssertEqual(@"Tip Calculator", tipVC.title, @"TipController has an incorrect title");
}

- (void)testSettingsIsSet
{
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    XCTAssertEqual(@"Settings", settingsVC.title, @"SettingsController has an incorrect title");
}

@end
