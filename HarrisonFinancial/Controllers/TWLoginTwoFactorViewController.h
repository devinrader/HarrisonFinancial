//
//  TWLoginTwoFactorViewController.h
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/21/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TWLoginTwoFactorViewController;

@protocol TWTwoFactorAuthDelegate <NSObject>
-(void)loginTwoFactorViewController:(TWLoginTwoFactorViewController *)controller passedAuthentication:(BOOL)passed;
@end

@interface TWLoginTwoFactorViewController : UIViewController

@property (weak, nonatomic) id<TWTwoFactorAuthDelegate> delegate;

@end
