//
//  TWDataStore.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 6/28/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWDataStore.h"
#import "TWAccount.h"
#import "TWTransaction.h"

@implementation TWDataStore

+ (TWDataStore *)instance {
    static TWDataStore *instance = nil;
    if (!instance) {
        instance = [[super allocWithZone:nil] init];
    }
    
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        accounts = [[NSMutableArray alloc] init];
        [self addAccounts];
        
        transactions = [[NSMutableArray alloc] init];
        [self addTransactions];
        
        homeNavigationOptions = [NSMutableArray arrayWithObjects:@"FAQ", @"Terms of Use", @"Privacy", nil];
        
        activitiesNavigationOptions = [NSMutableArray arrayWithObjects:
                                       @"My Accounts",
                                       @"Transfer",
                                       @"Deposit",
                                       @"Pay Bills",
                                       @"Document Center",
                                       @"Locations", nil];

    }
    return self;
}

- (NSArray *)accounts {
    return  accounts;
}

- (NSArray *)transactions {
    return transactions;
}

- (NSArray *)homeNavigationOptions {
    return homeNavigationOptions;
}

- (NSArray *)activitiesNavigationOptions {
    return activitiesNavigationOptions;
}

- (void) addAccounts {
    [accounts addObject:[[TWAccount alloc] initWithName:@"Checking" Extension:@"x4277" Balance:901.78]];
    [accounts addObject:[[TWAccount alloc] initWithName:@"Savings" Extension:@"x2213" Balance:4379.01]];
    [accounts addObject:[[TWAccount alloc] initWithName:@"Master Card" Extension:@"x1567" Balance:-3117.54]];
    [accounts addObject:[[TWAccount alloc] initWithName:@"Auto Loan" Extension:@"x4545" Balance:-29542.11]];
}

- (void) addTransactions {

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy"];
    
    [transactions addObject:[[TWTransaction alloc] initWithName:@"Check 192" Amount:101.00 Balance:901.78 Date:[df dateFromString:@"5/10/2013"]]];
    [transactions addObject:[[TWTransaction alloc] initWithName:@"Check 188" Amount:237.00 Balance:1002.78 Date:[df dateFromString:@"5/10/2013"]]];
    [transactions addObject:[[TWTransaction alloc] initWithName:@"PGE - online pay" Amount:182.15 Balance:1239.78 Date:[df dateFromString:@"5/8/2013"]]];
    [transactions addObject:[[TWTransaction alloc] initWithName:@"Check x190" Amount:47.98 Balance:1421.93 Date:[df dateFromString:@"5/8/2013"]]];
    [transactions addObject:[[TWTransaction alloc] initWithName:@"Allied W - online pay" Amount:312.05 Balance:1469.82 Date:[df dateFromString:@"5/8/2013"]]];
    [transactions addObject:[[TWTransaction alloc] initWithName:@"Check x191" Amount:27.54 Balance:1784.37 Date:[df dateFromString:@"5/8/2013"]]];
}


@end
