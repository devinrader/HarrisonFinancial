//
//  TWLoginViewController.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/20/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWLoginViewController.h"
#import "TWLoginCredentialsViewController.h"
#import "TWLoginTwoFactorViewController.h"

#import "TWLoginViewNavigationOptionsDelegate.h"

//#import "AFJSONRequestOperation.h"

@interface TWLoginViewController ()

@property (weak, nonatomic) IBOutlet UIView *vwLogin;
@property (weak, nonatomic) IBOutlet UITableView *tblNavigationOptions;

@end

TWLoginViewNavigationOptionsDelegate *_navOptionsDelegate;
TWLoginCredentialsViewController *_credentialsLoginController;
TWLoginTwoFactorViewController *_twoFactorLoginController;

NSMutableArray *options;

@implementation TWLoginViewController

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
    
    //load the login credentials subview
    _credentialsLoginController = [[TWLoginCredentialsViewController alloc] initWithNibName:@"LoginCredentialsView" bundle:nil];
    [_credentialsLoginController setDelegate:self];
    
//    [_vwLogin setBackgroundColor:[UIColor greenColor]];
    [_vwLogin addSubview:_credentialsLoginController.view];

    [_credentialsLoginController.view addConstraint:
     [NSLayoutConstraint constraintWithItem:_credentialsLoginController.view
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:_credentialsLoginController.view
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1
                                   constant:0]];
    
    
    _navOptionsDelegate = [[TWLoginViewNavigationOptionsDelegate alloc] init];
    
    options = [NSMutableArray arrayWithObjects:@"FAQ", @"Terms of Use", @"Privacy", nil];
    _navOptionsDelegate.data = options;
    
    [_tblNavigationOptions setDelegate:_navOptionsDelegate];
    [_tblNavigationOptions setDataSource:_navOptionsDelegate];
    
}

- (void)didReceiveMemoryWarning
{   
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginCredentialsViewController:(TWLoginCredentialsViewController *)controller doesNeedTwoFactorAuthentication:(BOOL)needsTwoFactorAuth {
    
    if (needsTwoFactorAuth) {

        // check to see if we have all of the parameters needed to do TFA,
        // and if not then show a alert and skip the TFA process
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *devicePhoneNumber = [defaults stringForKey:@"device_phone_number"];
        NSString *tfaSmsUrl = [defaults stringForKey:@"tfa_sms_url"];
//        NSString *fromPhoneNumber = [defaults stringForKey:@"from_phone_number"];
        
        if (!devicePhoneNumber || !tfaSmsUrl)
        {
            UIAlertView *invalidCredentials = [[UIAlertView alloc] initWithTitle:@"TFA Unavailable" message:@"Please configure the device phone number in the application settings" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [invalidCredentials show];
            
            [self dismissViewControllerAnimated:NO completion:nil];
            return;
        }

        //make a request to the TFA URL
//        NSURL *url  = [NSURL URLWithString:[tfaSmsUrl stringByAppendingFormat:@"?from=%@&to=%@", fromPhoneNumber, devicePhoneNumber]];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//
//            //check to see if we got true or false back and react accordingly
//            NSDictionary *result = (NSDictionary *)JSON;
//            
//            if ((BOOL)[result objectForKey:@"result"]) {
//    
//                _twoFactorLoginController = [[TWLoginTwoFactorViewController alloc] initWithNibName:@"LoginTwoFactorView" bundle:nil];
//                _twoFactorLoginController.delegate = self;
//            
//                [_credentialsLoginController.view removeFromSuperview];
//                [_vwLogin addSubview:_twoFactorLoginController.view];
//            }
//            else
//            {
//                //message send failed
//                //alert
//            }
//
//        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
//            NSLog(@"%@", error.localizedDescription);
//        }];
        
//        [operation start];
    }
    else
    {
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

-(void)loginTwoFactorViewController:(TWLoginTwoFactorViewController *)controller passedAuthentication:(BOOL)passed
{
    if (passed)
    {
        [self dismissViewControllerAnimated:NO completion:^{
            //code
        }];
    }
}


@end
