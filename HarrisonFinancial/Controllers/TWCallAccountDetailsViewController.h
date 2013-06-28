//
//  TWCallUsViewController.h
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/24/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWTransaction.h"

@interface TWCallAccountDetailsViewController : UIViewController

@property TWTransaction* transaction;
@property NSNumber *currentBalance;

@end
