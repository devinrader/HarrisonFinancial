//
//  TWAccountDetailViewController.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWAccountDetailViewController.h"
#import "TWAccountDetailViewTableDelegate.h"
#import "TWAccountDetailHeaderViewController.h"
#import "TWTransaction.h"

@interface TWAccountDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *tcAccount;
@property (weak, nonatomic) IBOutlet UITableView *tblAccountDetails;

@end

TWAccountDetailHeaderViewController *_header;
TWAccountDetailViewTableDelegate *_detailTableDelegate;

BOOL isDetailSelecting = NO;

NSMutableArray *transactions;

@implementation TWAccountDetailViewController

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
    
    self.navigationItem.title=@"Checking";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Call Us" style:UIBarButtonSystemItemAction target:self action:@selector(CallUs:)];
    
    transactions = [self buildData];
    
    _detailTableDelegate = [[TWAccountDetailViewTableDelegate alloc] init];
    _detailTableDelegate.data = transactions;
    
    _header = [[TWAccountDetailHeaderViewController alloc] init];
    _header = [[TWAccountDetailHeaderViewController alloc] initWithNibName:@"AccountDetailsHeaderView" bundle:nil];
    CGRect newFrame = _header.view.frame;
    newFrame.size.height = 44;
    _header.view.frame = newFrame;
    
    [self.tableView setDelegate:_detailTableDelegate];
    [self.tableView setDataSource:_detailTableDelegate];
    [self.tableView setTableHeaderView:_header.view];

    _tcAccount.textLabel.text = [[self account] name];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    if ([[self account] balance] < 0)
    {
        _tcAccount.detailTextLabel.textColor = [UIColor redColor];
    }

    _tcAccount.detailTextLabel.text = [formatter stringFromNumber:[NSNumber numberWithDouble:[[self account] balance] ]];
}

-(IBAction)CallUs:(id)sender {
    
    if (isDetailSelecting) {
        
        isDetailSelecting = NO;
        self.navigationItem.rightBarButtonItem.title = @"Call Us";
        
        _detailTableDelegate.data = [self buildData];
        
        [self.tableView beginUpdates];
        [self.tableView setDelegate:_detailTableDelegate];
        [self.tableView setDataSource:_detailTableDelegate];
        [self.tableView reloadData];

        CGRect newFrame = _header.view.frame;
        newFrame.size.height = 44;
        _header.view.frame = newFrame;
        
        [self.tableView setTableHeaderView:_header.view];

        [self.tableView endUpdates];
    }
    else{
        //show the hidden label
        isDetailSelecting = YES;
        self.navigationItem.rightBarButtonItem.title = @"Done";
        
        _detailTableDelegate.data = [self buildData];

        [self.tableView beginUpdates];
        [self.tableView setDelegate:_detailTableDelegate];
        [self.tableView setDataSource:_detailTableDelegate];
        [self.tableView reloadData];
        
        CGRect newFrame = _header.view.frame;
        newFrame.size.height = 78;
        _header.view.frame = newFrame;
        
        [self.tableView setTableHeaderView:_header.view];
        [self.tableView endUpdates];
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSMutableArray*)buildData {
    
    NSMutableArray *array;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy"];
    
    array = [NSMutableArray arrayWithObjects:
                    [[TWTransaction alloc] initWithName:@"Check 192" Amount:101.00 Balance:901.78 TransactionDate:[df dateFromString:@"5/10/2013"]],
                    [[TWTransaction alloc] initWithName:@"Check 188" Amount:237.00 Balance:1002.78 TransactionDate:[df dateFromString:@"5/10/2013"]],
                    [[TWTransaction alloc] initWithName:@"PGE - online pay" Amount:182.15 Balance:1239.78 TransactionDate:[df dateFromString:@"5/8/2013"]],
                    [[TWTransaction alloc] initWithName:@"Check x190" Amount:47.98 Balance:1421.93 TransactionDate:[df dateFromString:@"5/8/2013"]],
                    [[TWTransaction alloc] initWithName:@"Allied W - online pay" Amount:312.05 Balance:1469.82 TransactionDate:[df dateFromString:@"5/8/2013"]],
                    [[TWTransaction alloc] initWithName:@"Check x191" Amount:27.54 Balance:1784.37 TransactionDate:[df dateFromString:@"5/8/2013"]],
                    nil];
    
    return array;
}
@end
