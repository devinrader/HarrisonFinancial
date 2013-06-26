//
//  TWAccountsViewTableDelegate.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWAccountDetailViewTableDelegate.h"
#import "TWTransaction.h"

@implementation TWAccountDetailViewTableDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *array = [self createFilteredArray:section];
    return array.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section==0)
        return @"May 10";
    
    return @"May 8";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"acell"];
    
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

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//}

- (NSArray*)createFilteredArray:(NSInteger) section {

    NSArray *filtered;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy"];
    
    if (section==0) {
        //filter the data
        NSPredicate *p = [NSPredicate predicateWithFormat:@"transactionDate > %@", [df dateFromString:@"5/9/2013"]];
        filtered = [_data filteredArrayUsingPredicate:p];
    }
    else{
        //filter the data
        NSPredicate *p = [NSPredicate predicateWithFormat:@"transactionDate < %@", [df dateFromString:@"5/9/2013"]];
        filtered = [_data filteredArrayUsingPredicate:p];
    }
    
    return filtered;
}
@end
