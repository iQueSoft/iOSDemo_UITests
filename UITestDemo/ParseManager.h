//
//  ParseManager.h
//  UITestDemo
//
//  Created by Oleg Vishnivetskiy on 09/12/15.
//  Copyright © 2015 Oleg Vishnivetskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ResultBlock)(BOOL success, NSError *error);

@interface ParseManager : NSObject

+ (id)sharedManager;

- (void)loginWithUsername: (NSString *)username password: (NSString *)password success: (ResultBlock)result;

@end
