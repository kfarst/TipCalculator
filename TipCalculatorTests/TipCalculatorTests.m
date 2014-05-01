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

@interface TipCalculatorTests : XCTestCase

@property (strong, nonatomic) TipViewController *tipVC;

@end

@implementation TipCalculatorTests

- (void)setUp
{
    [super setUp];
    self.tipVC = [[TipViewController alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testInitValues
{
    [self.tipVC loadView];
    
    XCTAssert([self.tipVC.billAmount.text isEqualToString:@""], @"Bill amount is not empty");
    XCTAssert([self.tipVC.tipLabel.text isEqualToString:@"$0.00"], @"Tip label is not correct");
    XCTAssert([self.tipVC.totalLabel.text isEqualToString:@"$0.00"], @"Total label is not correct");
    XCTAssertEqual(self.tipVC.tipControl.selectedSegmentIndex, 0, @"Tip control does not have the first button selected");
}

- (void)testTitleIsSet
{
    XCTAssertEqual(@"Tip Calculator", self.tipVC.title, @"TipController has an incorrect title");
}

@end
