//
//  TWTransaction.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWTransaction.h"

@implementation TWTransaction

-(id)initWithName: (NSString*)n Amount:(double)a Balance:(double)b TransactionDate:(NSDate*)d{
    
    if (self = [super init])
    {
        self.title = n;
        self.amount = a;
        self.balance = b;
        self.transactionDate = d;
    }
    
    return self;
}
@end
