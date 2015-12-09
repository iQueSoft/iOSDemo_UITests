//
//  ParseManager.m
//  UITestDemo
//
//  Created by Oleg Vishnivetskiy on 09/12/15.
//  Copyright © 2015 Oleg Vishnivetskiy. All rights reserved.
//

#import "ParseManager.h"
#import "Constants.h"

@implementation ParseManager

+ (id)sharedManager {
    static ParseManager *parseManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        parseManager = [[self alloc] init];
    });
    return parseManager;
}

- (void)loginWithUsername: (NSString *)username password: (NSString *)password success: (ResultBlock )resultBlock {
    
    if ([[NSProcessInfo processInfo].arguments containsObject:kUseMockString]) {
        // Use your mock object here
        if ([username isEqualToString: kCorrectUserName] && [password isEqualToString: kPassword]) {
            resultBlock(YES, nil);
        } else {
            NSError *theError = [NSError errorWithDomain: @"Login Error" code: 1 userInfo: @{NSLocalizedDescriptionKey : @"Your user name and password\nincorrect.\nTry again"}];
            
            resultBlock(NO, theError);
        }
    } else {
        
        // here should be login to the parse server
        
        NSError *theError = [NSError errorWithDomain: @"Login Error" code: 1 userInfo: @{NSLocalizedDescriptionKey : @"The real login isn't implemented.\n This app just UI tests demo \n Check tests in UITestDemoUItests.m file"}];
        
        resultBlock(NO, theError);
    }
}

@end
