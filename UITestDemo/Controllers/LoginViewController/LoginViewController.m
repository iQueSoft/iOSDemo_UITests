//
//  LoginViewController.m
//  UITestDemo
//
//  Created by Oleg Vishnivetskiy on 09/12/15.
//  Copyright © 2015 Oleg Vishnivetskiy. All rights reserved.
//

#import "LoginViewController.h"
#import "ParseManager.h"

static NSString * const kLoginToWelcomeSegueId = @"loginToWelcome";

@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginAction:(UIButton *)sender {
    [[ParseManager sharedManager] loginWithUsername: self.userNameTextField.text password: self.passwordTextField.text success:^(BOOL success, NSError *error) {
        if (success) {
            [self performSegueWithIdentifier: kLoginToWelcomeSegueId sender: self];
        } else {
            [self showError: error];
        }
    }];
}

- (IBAction)backAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated: YES];
}

- (void)showError: (NSError *)error {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Sorry!" message: error.localizedDescription preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle: @"Ok" style: UIAlertActionStyleCancel handler: nil];
    [alert addAction: action];
    
    [self presentViewController: alert animated: YES completion: nil];
}

@end
