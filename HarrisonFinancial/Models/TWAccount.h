//
//  TWAccount.h
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWAccount : NSObject

@property (weak, nonatomic) NSString* name;
@property (weak, nonatomic) NSString* extension;
@property (nonatomic) double balance;


-(id)initWithName: (NSString*)n Extension:(NSString*)e Balance:(double)b;

@end
