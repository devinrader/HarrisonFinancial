//
//  TWAccountsViewController.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWAccountsTableViewController.h"
//#import "TWAccount.h"
#import "TWDataStore.h"

#import "TWAccountsViewTableDelegate.h"
#import "TWAccountsSelectionTableDelegate.h"

@interface TWAccountsTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tblAccountsList;

@end

TWAccountsViewTableDelegate *_accountsViewDelegate;
TWAccountsSelectionTableDelegate *_accountsSelectionDelegate;

BOOL isSelecting = NO;

@implementation TWAccountsTableViewController

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
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Background"]];
    [[self view] setBackgroundColor:background];
    
    self.navigationItem.title=@"Accounts";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Call Us" style:UIBarButtonSystemItemAction target:self action:@selector(CallUs:)];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    _accountsViewDelegate = [[TWAccountsViewTableDelegate alloc] init];
    _accountsViewDelegate.nav = self.navigationController;
    
    _accountsSelectionDelegate = [[TWAccountsSelectionTableDelegate alloc] init];
    _accountsSelectionDelegate.nav = self.navigationController;
    
    [self.tableView setDelegate:_accountsViewDelegate];
    [self.tableView setDataSource:_accountsViewDelegate];
    [self.tableView setTableHeaderView:nil];
}

-(IBAction)CallUs:(id)sender {
    
    if (isSelecting) {
        
        isSelecting = NO;
        self.navigationItem.rightBarButtonItem.title = @"Call Us";

        [self.tableView beginUpdates];
        [self.tableView setTableHeaderView:nil];
        [self.tableView setDelegate:_accountsViewDelegate];
        [self.tableView setDataSource:_accountsViewDelegate];
        [self.tableView reloadData];
        [self.tableView endUpdates];
    }
    else{
        //show the hidden label
        isSelecting = YES;
        self.navigationItem.rightBarButtonItem.title = @"Done";
    
        //put the table into selection mode
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60,0,260,40)];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setText:@"Select an item to call"];
        [label setTextAlignment:NSTextAlignmentCenter];
        
        [self.tableView beginUpdates];
        [self.tableView setTableHeaderView:label];
        [self.tableView setDelegate:_accountsSelectionDelegate];
        [self.tableView setDataSource:_accountsSelectionDelegate];
        [self.tableView reloadData];
        [self.tableView endUpdates];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
