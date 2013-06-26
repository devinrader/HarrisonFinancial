//
//  TWLoginCredentialsViewController.h
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/20/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TWLoginCredentialsViewController;

@protocol TWLoginCredentialsDelegate <NSObject>
-(void)loginCredentialsViewController:(TWLoginCredentialsViewController *)controller doesNeedTwoFactorAuthentication:(BOOL)needsTwoFactorAuth;
@end

@interface TWLoginCredentialsViewController : UIViewController

@property (weak, nonatomic) id<TWLoginCredentialsDelegate> delegate;

@end
