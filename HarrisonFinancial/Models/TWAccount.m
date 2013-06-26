//
//  TWAccount.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWAccount.h"

@implementation TWAccount

-(id)initWithName: (NSString*)n Extension:(NSString*)e Balance:(double)b {
    
    if (self = [super init])
    {
    self.name = n;
    self.extension = e;
    self.balance = b;
    }
    
    return self;
}

@end
