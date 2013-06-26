//
//  TWLoginTwoFactorViewController.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWLoginTwoFactorViewController.h"

@interface TWLoginTwoFactorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtTwoFactor;

@end

@implementation TWLoginTwoFactorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnTwoFactorLogin:(id)sender {
    
    if ([[[self txtTwoFactor] text] isEqual: @"1234"]) {
        [self.delegate loginTwoFactorViewController:self passedAuthentication:YES];
    }
    else {
        [self.delegate loginTwoFactorViewController:self passedAuthentication:NO];
        
        //if invalid show dialog
        UIAlertView *invalidCode = [[UIAlertView alloc] initWithTitle:@"Invalid Code" message:@"Please enter a valid code" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [invalidCode show];
    }
}

@end
