//
//  TWAccountDetailViewController.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWAccountDetailTableViewController.h"
#import "TWAccountDetailViewTableDelegate.h"
#import "TWAccountDetailSelectionTableDelegate.h"
#import "TWAccountDetailHeaderViewController.h"
#import "TWDataStore.h"

@interface TWAccountDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *tcAccount;
@property (weak, nonatomic) IBOutlet UITableView *tblAccountDetails;
@end

TWAccountDetailHeaderViewController *_tableheaderView;
TWAccountDetailViewTableDelegate *_detailTableDelegate;
TWAccountDetailSelectionTableDelegate *_detailSelectionDelegate;

BOOL isDetailSelecting = NO;

@implementation TWAccountDetailTableViewController

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
    
    //Prep the table header
    _tableheaderView = [[TWAccountDetailHeaderViewController alloc] init];
    _tableheaderView = [[TWAccountDetailHeaderViewController alloc] initWithNibName:@"AccountDetailsHeaderView" bundle:nil];
    CGRect newFrame = _tableheaderView.view.frame;
    newFrame.size.height = 44;
    _tableheaderView.view.frame = newFrame;

    _detailTableDelegate = [[TWAccountDetailViewTableDelegate alloc] init];
    _detailTableDelegate.nav = self.navigationController;
    
    _detailSelectionDelegate = [[TWAccountDetailSelectionTableDelegate alloc] init];
    _detailSelectionDelegate.nav = self.navigationController;

    [self.tableView setDelegate:_detailTableDelegate];
    [self.tableView setDataSource:_detailTableDelegate];
    [self.tableView setTableHeaderView:_tableheaderView.view];
    
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
        
        [self.tableView beginUpdates];
        [self.tableView setDelegate:_detailTableDelegate];
        [self.tableView setDataSource:_detailTableDelegate];
        [self.tableView reloadData];

        CGRect newFrame = _tableheaderView.view.frame;
        newFrame.size.height = 44;
        _tableheaderView.view.frame = newFrame;
        
        [self.tableView setTableHeaderView:_tableheaderView.view];

        [self.tableView endUpdates];
    }
    else{
        //show the hidden label
        isDetailSelecting = YES;
        self.navigationItem.rightBarButtonItem.title = @"Done";
        
        [self.tableView beginUpdates];
        [self.tableView setDelegate:_detailSelectionDelegate];
        [self.tableView setDataSource:_detailSelectionDelegate];
        [self.tableView reloadData];
        
        CGRect newFrame = _tableheaderView.view.frame;
        newFrame.size.height = 78;
        _tableheaderView.view.frame = newFrame;
        
        [self.tableView setTableHeaderView:_tableheaderView.view];
        [self.tableView endUpdates];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
