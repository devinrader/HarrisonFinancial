//
//  TWAccountsSelectionTableDelegate.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/24/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWAccountsSelectionTableDelegate.h"

#import "TWDataStore.h"
#import "TWAccount.h"

#import "TWCallAccountViewController.h"

@implementation TWAccountsSelectionTableDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[TWDataStore instance] accounts] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"bcell"];
    
    TWAccount *account = [[[TWDataStore instance] accounts] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = account.name;
    
    NSLog(@"Need to add the phone icon");
    //cell.imageView.image = ;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    //do I need to show confirmation alert here?
    
    TWCallAccountViewController *controller = [[TWCallAccountViewController alloc] initWithNibName:@"CallAccountView" bundle:nil];
    controller.account = [[[TWDataStore instance] accounts] objectAtIndex:indexPath.row];
    
    [_nav presentViewController:controller animated:YES completion:nil];    
}

@end
