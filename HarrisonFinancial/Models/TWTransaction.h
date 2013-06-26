//
//  TWTransaction.h
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWTransaction : NSObject
@property (weak, nonatomic) NSString* title;
@property (nonatomic) double amount;
@property (nonatomic) double balance;
@property (weak, nonatomic) NSDate* transactionDate;

-(id)initWithName: (NSString*)n Amount:(double)a Balance:(double)b TransactionDate:(NSDate*)d;

@end
