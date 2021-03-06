//
//  PELoginViewController.m
//  PodioExpenses
//
//  Created by Sebastian Rehnby on 14/05/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>
#import "PELoginViewController.h"

@interface PELoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation PELoginViewController

- (IBAction)login {
  // Normally you would perform some kind of validation here, but we will skip it for this sample app.
  NSString *email = self.emailTextField.text;
  NSString *password = self.passwordTextField.text;
  
  [SVProgressHUD showWithStatus:@"Signing in..."];
  
  // This will authenticate the user agains the Podio API and maintain a session token
  [[PodioKit authenticateAsUserWithEmail:email password:password] onSuccess:^(id result) {
    [SVProgressHUD dismiss];
    NSLog(@"Successfully authenticated");
  } onError:^(NSError *error) {
    [SVProgressHUD dismiss];
    NSLog(@"Error: %@", [error localizedDescription]);
  }];
}

@end
