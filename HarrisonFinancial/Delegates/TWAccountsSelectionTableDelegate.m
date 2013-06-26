//
//  TWAccountsSelectionTableDelegate.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/24/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWAccountsSelectionTableDelegate.h"
#import "TWCallAccountViewController.h"
#import "TWAccount.h"

@implementation TWAccountsSelectionTableDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"bcell"];
    
    TWAccount *account = [_data objectAtIndex:indexPath.row];
    
    cell.textLabel.text = account.name;
    //cell.imageView.image = ;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    //do I need to show confirmation alert here?
    
    TWCallAccountViewController *controller = [[TWCallAccountViewController alloc] initWithNibName:@"CallAccountView" bundle:nil];
    controller.account = [_data objectAtIndex:indexPath.row];
    
    [_nav presentViewController:controller animated:YES completion:nil];    
}


@end
