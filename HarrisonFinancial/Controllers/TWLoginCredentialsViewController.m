//
//  TWLoginCredentialsViewController.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/20/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWLoginCredentialsViewController.h"

@interface TWLoginCredentialsViewController()
@property (weak, nonatomic) IBOutlet UITextField *lblLoginId;
@property (weak, nonatomic) IBOutlet UITextField *lblPassword;
@end

@implementation TWLoginCredentialsViewController

- (IBAction)btnCredentialsLogin:(id)sender {
    
    //validate the credentials here (can we integrate with Azure Mobile Services?)
    
    if (
        (
         [[[self lblLoginId] text] isEqual: @"user1"] ||
         [[[self lblLoginId] text] isEqual: @"user2"]
        ) &&
        
        [[[self lblPassword] text] isEqual: @"pass"]
        )
        
    {
        if ([[[self lblLoginId] text] isEqual: @"user1"]) {
            [self.delegate loginCredentialsViewController:self doesNeedTwoFactorAuthentication:YES];
        }
        else {
            [self.delegate loginCredentialsViewController:self doesNeedTwoFactorAuthentication:NO];
        }
        
        return;
    }
    
    //if invalid show dialog
    UIAlertView *invalidCredentials = [[UIAlertView alloc] initWithTitle:@"Invalid Credentials" message:@"Please enter valid credentials" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [invalidCredentials show];
}


@end
