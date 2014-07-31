//
//  HNYAppDelegate.m
//  HackNY
//
//  Created by KyleR on 7/22/14.
//  Copyright (c) 2014 Heartwood Labs. All rights reserved.
//

#import "HNYAppDelegate.h"
#import "MainViewController.h"
#import <Parse/Parse.h>
#import "HNFellow.h"
#import "HNYear.h"


@implementation HNYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"ak54Y7fvYqULpElUjAyWgb4oTB6hRXL3bzOUQlC7"
                  clientKey:@"l2qrTMDjP5mHNjZJ3AeBMaoq7qhaVICVur7YV92r"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    PFQuery *query = [PFQuery queryWithClassName:@"fellows"];
    [query whereKey:@"approved" equalTo:@YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *fellows, NSError *error) {
        if (!error) {
            NSMutableDictionary *hackNYYears = [[NSMutableDictionary alloc] init];
            for (PFObject *fellow in fellows) {

                NSNumber *year = [NSNumber numberWithInt:[[fellow objectForKey:@"year"] intValue]];
                NSString *yearKey = [NSString stringWithFormat:@"%i", [year intValue]];
                if (![hackNYYears objectForKey:yearKey]) {
                    [hackNYYears setObject:[[NSMutableArray alloc] init] forKey:yearKey];
                }
                [[hackNYYears objectForKey:yearKey] addObject:fellow];

                HNYear *HNYear = [[HNYear alloc] init];
                [HNYear addObject:[HNFellow configureUserWithPFObject:object]];
            }
        }
    }];
   
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
