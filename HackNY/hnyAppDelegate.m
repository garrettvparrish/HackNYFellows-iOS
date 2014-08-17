//
//  hnyAppDelegate.m
//  HackNY
//
//  Created by KyleR on 7/22/14.
//  Copyright (c) 2014 HackNY All rights reserved.
//

#import "hnyAppDelegate.h"
#import "MainViewController.h"
#import <Parse/Parse.h>
#import "hnyFellow.h"
#import "hnyYear.h"
#import "hnyRootViewController.h"

hnyAppDelegate* AppDelegate()
{
    return (hnyAppDelegate*) [[UIApplication sharedApplication] delegate];
}

@implementation hnyAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // main initializations
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    hnyRootViewController *rootViewController = [[hnyRootViewController alloc] init];
    self.window.rootViewController = rootViewController;
    
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];

    // parse
    [Parse setApplicationId:@"ak54Y7fvYqULpElUjAyWgb4oTB6hRXL3bzOUQlC7"
                  clientKey:@"l2qrTMDjP5mHNjZJ3AeBMaoq7qhaVICVur7YV92r"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    PFQuery *query = [PFQuery queryWithClassName:@"fellow"];
    [query whereKey:@"approved" equalTo:@YES];
    query.cachePolicy = kPFCachePolicyNetworkElseCache;
    [query findObjectsInBackgroundWithBlock:^(NSArray *fellows, NSError *error) {
        if (!error) {
            
            NSLog(@"Downloaded Data without error");
            
            self.hackNYFellowLists = [[NSMutableDictionary alloc] init];
            
            for (PFObject *fellow in fellows) {
                
                NSNumber *year = [NSNumber numberWithInt:[fellow[@"year"] intValue]];
                NSString *yearKey = [NSString stringWithFormat:@"%i", [year intValue]];
                if (![self.hackNYFellowLists objectForKey:yearKey]) {
                    [self.hackNYFellowLists setObject:[[NSMutableArray alloc] init] forKey:yearKey];
                }
                [[self.hackNYFellowLists objectForKey:yearKey] addObject:fellow];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"dataRefreshed" object:nil];
            }

            [self.hackNYFellowLists enumerateKeysAndObjectsUsingBlock: ^(NSString *year, NSMutableArray *fellowList, BOOL *stop) {
                [self.hackNYYears setObject:[[hnyYear alloc] initWithFellows:fellowList] forKey:year];
            }];
            
        }
    }];
   
    return YES;
}

- (UIColor *)hnyMainColor {
    return [UIColor colorWithRed:0.933 green:0.231 blue:0.165 alpha:1];
}

- (UIColor *)lightMainColor {
    return [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
}

- (NSNumber *)currentYear {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *yearString = [formatter stringFromDate:[NSDate date]];
    NSNumber *number = [NSNumber numberWithInteger:[yearString integerValue]];
    return number;
}

- (NSNumber *)numberOfYearsOfHackNY {
    NSNumber *numberOfYearsOfHackNY = [NSNumber numberWithInt:[[self currentYear] intValue] - 2010];
    return numberOfYearsOfHackNY;
}

- (NSMutableArray *)arrayOfYears {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = [[self currentYear] intValue]; i >= 2011; i--) {
        [array addObject:[NSString stringWithFormat:@"%i", i]];
    }
    return array;
}

- (NSMutableDictionary *)getDataSource {
    return self.hackNYFellowLists;
}


@end
