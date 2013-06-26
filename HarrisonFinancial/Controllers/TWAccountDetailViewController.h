//
//  TWAccountDetailViewController.h
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TWAccount.h"

@interface TWAccountDetailViewController : UITableViewController

@property (weak, nonatomic) TWAccount* account;

@end
