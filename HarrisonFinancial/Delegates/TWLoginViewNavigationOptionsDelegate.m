//
//  TWLoginViewNavigationOptionsDelegate.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWLoginViewNavigationOptionsDelegate.h"

@implementation TWLoginViewNavigationOptionsDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self data] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"lcell"];
    
    cell.textLabel.text = [[self data] objectAtIndex:indexPath.row];
    
    return cell;
}

@end
