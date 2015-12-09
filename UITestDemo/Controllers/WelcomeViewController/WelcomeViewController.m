//
//  WelcomeViewController.m
//  UITestDemo
//
//  Created by Oleg Vishnivetskiy on 09/12/15.
//  Copyright © 2015 Oleg Vishnivetskiy. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (IBAction)backAction:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
