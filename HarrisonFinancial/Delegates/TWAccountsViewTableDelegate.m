//
//  TWAccountsViewTableDelegate.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWAccountsViewTableDelegate.h"
#import "TWAccount.h"
#import "TWAccountDetailViewController.h"


@implementation TWAccountsViewTableDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"acell"];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    TWAccount *account = [_data objectAtIndex:indexPath.row];
    
    cell.textLabel.text = account.name;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    if (account.balance < 0)
    {
        cell.detailTextLabel.textColor = [UIColor redColor];
    }
    
    cell.detailTextLabel.text = [formatter stringFromNumber:[NSNumber numberWithDouble:account.balance]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {

    TWAccountDetailViewController *details = [[TWAccountDetailViewController alloc] initWithStyle:UITableViewStylePlain];
    details.account = [_data objectAtIndex:indexPath.row];
    
    [_nav pushViewController:details animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TWAccountDetailViewController *details = [[TWAccountDetailViewController alloc] initWithStyle:UITableViewStylePlain];
    details.account = [_data objectAtIndex:indexPath.row];
    
    [_nav pushViewController:details animated:YES];
}

@end
