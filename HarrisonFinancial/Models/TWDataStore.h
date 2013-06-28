//
//  TWDataStore.h
//  HarrisonFinancial
//
//  Created by Devin Rader on 6/28/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TWAccount;
@class TWTransaction;

@interface TWDataStore : NSObject
{
    NSMutableArray *accounts;
    NSMutableArray *transactions;
    NSMutableArray *homeNavigationOptions;
    NSMutableArray *activitiesNavigationOptions;
}

+(TWDataStore *)instance;

- (NSArray *) accounts;
- (NSArray *) transactions;
- (NSArray *) homeNavigationOptions;
- (NSArray *) activitiesNavigationOptions;

@end
