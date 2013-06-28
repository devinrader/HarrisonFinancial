//
//  TWLoginViewNavigationOptionsDelegate.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWLoginViewNavigationOptionsDelegate.h"

#import "TWDataStore.h"

@implementation TWLoginViewNavigationOptionsDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[TWDataStore instance] homeNavigationOptions] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"lcell"];
    
    cell.textLabel.text = [[[TWDataStore instance] homeNavigationOptions] objectAtIndex:indexPath.row];
    
    return cell;
}

@end
