//
//  TWCallUsViewController.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/24/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWCallAccountViewController.h"
#import "TWPhone.h"

@interface TWCallAccountViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblItem;
@property (weak, nonatomic) IBOutlet UILabel *lblBalance;
//@property (weak, nonatomic) TWPhone *phone;

@end

TWPhone *_phone;

@implementation TWCallAccountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[self lblBalance] setText:[NSString stringWithFormat:@"Current Balance: %.02f", self.account.balance]];
    [[self lblItem] setText:[NSString stringWithFormat:@"Item: %@ Account", self.account.name]];
    
    _phone = [[TWPhone alloc] init];
    [_phone connect];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnHangup:(id)sender {
    
    if (_phone) {
        [_phone disconnect];
    }
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
