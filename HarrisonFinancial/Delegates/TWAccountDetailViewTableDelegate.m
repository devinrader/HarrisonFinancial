//
//  TWAccountsViewTableDelegate.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWAccountDetailViewTableDelegate.h"
#import "TWCallAccountDetailsViewController.h"
#import "TWDataStore.h"
#import "TWTransaction.h"

@implementation TWAccountDetailViewTableDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *array = [self createFilteredArray:section];
    
    return array.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section==0) {
        return @"May 10";
    }
    return @"May 8";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ccell"];
    
    NSArray *array = [self createFilteredArray:indexPath.section];
    
    if (array.count>0){
        
        TWTransaction *transaction = [array objectAtIndex:indexPath.row];
    
        cell.textLabel.text = transaction.title;
    
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
        if (transaction.balance < 0)
        {
            cell.detailTextLabel.textColor = [UIColor redColor];
        }
    
        cell.detailTextLabel.text = [formatter stringFromNumber:[NSNumber numberWithDouble:transaction.amount]];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [cell setBackgroundColor:[UIColor clearColor]];
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    //do I need to show confirmation alert here?
//    
//    TWCallAccountDetailsViewController *controller = [[TWCallAccountDetailsViewController alloc] initWithNibName:@"CallAccountDetailView" bundle:nil];
//    controller.transaction = [[[TWDataStore instance] transactions] objectAtIndex:indexPath.row];
//    
//    [[self nav] presentViewController:controller animated:YES completion:nil];
//}


- (NSArray*)createFilteredArray:(NSInteger) section {

    NSArray *filtered;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy"];
    
    if (section==0) {
        NSPredicate *p = [NSPredicate predicateWithFormat:@"transactionDate > %@", [df dateFromString:@"5/9/2013"]];
        filtered = [[[TWDataStore instance] transactions] filteredArrayUsingPredicate:p];
    }
    else{
        NSPredicate *p = [NSPredicate predicateWithFormat:@"transactionDate < %@", [df dateFromString:@"5/9/2013"]];
        filtered = [[[TWDataStore instance] transactions] filteredArrayUsingPredicate:p];
    }
    
    return filtered;
}
@end
