//
//  TWCallUsViewController.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/24/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWCallAccountDetailsViewController.h"
#import "TWPhone.h"

@interface TWCallAccountDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblItem;
@property (weak, nonatomic) IBOutlet UILabel *lblBalance;
@property (weak, nonatomic) IBOutlet UILabel *lblTransactionDate;
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentBalance;

@end

TWPhone *_phone;

@implementation TWCallAccountDetailsViewController

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
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Background"]];
    [[self view] setBackgroundColor:background];


    [[self lblItem] setText:[NSString stringWithFormat:@"Item: %@", self.transaction.title]];
    [[self lblBalance] setText:[NSString stringWithFormat:@"Amount: %.02f", self.transaction.amount]];
    [[self lblTransactionDate] setText:[NSString stringWithFormat:@"Posted: %@", self.transaction.transactionDate]];

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
