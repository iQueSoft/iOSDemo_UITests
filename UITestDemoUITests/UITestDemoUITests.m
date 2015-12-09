//
//  UITestDemoUITests.m
//  UITestDemoUITests
//
//  Created by Oleg Vishnivetskiy on 09/12/15.
//  Copyright © 2015 Oleg Vishnivetskiy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Constants.h"

@interface UITestDemoUITests : XCTestCase

@end

@implementation UITestDemoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    app.launchArguments = @[kUseMockString];
    [app launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCorrectLogin {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Login"] tap];
    
    XCUIElement *usernameTextField = app.textFields[@"UserName"];
    [usernameTextField tap];
    [usernameTextField typeText:kCorrectUserName];
    
    XCUIElement *passwordSecureTextField = app.secureTextFields[@"Password"];
    [passwordSecureTextField tap];
    [passwordSecureTextField tap];
    [passwordSecureTextField typeText:kPassword];
    
    [app.buttons[@"EnterLogin"] tap];
    
    [[[[[[XCUIApplication alloc] init].navigationBars[@"Welcome"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
}

- (void) testIncorrectCorrectLogin {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Login"] tap];
    
    XCUIElement *usernameTextField = app.textFields[@"UserName"];
    [usernameTextField tap];
    [usernameTextField typeText:kIncorrectUserName];
    
    XCUIElement *passwordSecureTextField = app.secureTextFields[@"Password"];
    [passwordSecureTextField tap];
    [passwordSecureTextField tap];
    [passwordSecureTextField typeText:kPassword];
    
    [app.buttons[@"EnterLogin"] tap];
    [app.alerts[@"Sorry!"].collectionViews.buttons[@"Ok"] tap];
    
    [[[[[[XCUIApplication alloc] init].navigationBars[@"Login"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
}


@end
