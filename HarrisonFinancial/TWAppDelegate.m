//
//  TWAppDelegate.m
//  HarrisonFinancial
//
//  Created by Devin Rader on 5/20/13.
//  Copyright (c) 2013 Samples. All rights reserved.
//

#import "TWAppDelegate.h"
#import "TWMainTabBarViewController.h"

#import "TWLoginViewController.h"
#import "TWActivitiesNavigationViewController.h"
#import "TWActivitiesTableViewController.h"

@implementation TWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Background"]];
    UIImage* homeImage = [UIImage imageNamed:@"home.png"];
    UIImage* prodImage = [UIImage imageNamed:@"product.png"];
    UIImage* inbxImage = [UIImage imageNamed:@"inbox.png"];
    
    // Set the application defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *appDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"YES", @"dial_queue",
                                 @"http://devin.webscript.io/sendTFASMS", @"tfa_sms_url",
                                 nil];
                                 
    [defaults registerDefaults:appDefaults];
    [defaults synchronize];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //UITabBarController - root container
    TWMainTabBarViewController *main = [[TWMainTabBarViewController alloc] init];
    
    //UITableViewController - main content in nav controller
    TWActivitiesTableViewController *activitiesTable = [[TWActivitiesTableViewController alloc] initWithStyle:UITableViewStylePlain];
    activitiesTable.view.backgroundColor = background;
    
    //UINavigationController - tab in root container
    TWActivitiesNavigationViewController *activitiesNavigation = [[TWActivitiesNavigationViewController alloc] initWithRootViewController:activitiesTable];
    activitiesNavigation.tabBarItem.title = @"Home";
    activitiesNavigation.tabBarItem.image = homeImage;
    activitiesNavigation.navigationBar.barStyle=UIBarStyleBlack;
    
    // This is a non-functional placeholder tab
    UIViewController *placeholder1 = [[UIViewController alloc]init];
    [placeholder1.tabBarItem setTitle:@"Inbox"];
    [placeholder1.tabBarItem setImage:inbxImage];
    [placeholder1.tabBarItem setEnabled:NO];
    
    // This is a non-functional placeholder tab
    UIViewController *placeholder2 = [[UIViewController alloc]init];
    [placeholder2.tabBarItem setTitle:@"Products"];
    [placeholder2.tabBarItem setImage:prodImage];
    [placeholder2.tabBarItem setEnabled:NO];
    
    [main addChildViewController:activitiesNavigation];
    [main addChildViewController:placeholder1];
    [main addChildViewController:placeholder2];

    main.view.backgroundColor = background;
    self.window.rootViewController = main;

    
    //Create the login view and show as a modal
    TWLoginViewController *login = [[TWLoginViewController alloc] initWithNibName:@"LoginView" bundle:nil];
    login.view.backgroundColor = background;

    [self.window makeKeyAndVisible];
    [self.window.rootViewController presentViewController:login animated:NO completion:nil];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
