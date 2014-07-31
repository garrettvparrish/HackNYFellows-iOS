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

HNYAppDelegate* AppDelegate()
{
    return (HNYAppDelegate*) [[UIApplication sharedApplication] delegate];
}

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
            
            NSMutableDictionary *hackNYFellowLists = [[NSMutableDictionary alloc] init];
            for (PFObject *fellow in fellows) {

                NSNumber *year = [NSNumber numberWithInt:[[fellow objectForKey:@"year"] intValue]];
                NSString *yearKey = [NSString stringWithFormat:@"%i", [year intValue]];
                if (![hackNYFellowLists objectForKey:yearKey]) {
                    [hackNYFellowLists setObject:[[NSMutableArray alloc] init] forKey:yearKey];
                }
                [[hackNYFellowLists objectForKey:yearKey] addObject:fellow];
            }

            [hackNYFellowLists enumerateKeysAndObjectsUsingBlock: ^(NSString *year, NSMutableArray *fellowList, BOOL *stop) {
                [self.hackNYYears setObject:[[HNYear alloc] initWithFellows:fellowList] forKey:year];
            }];
        }
    }];
   
    return YES;
}
							
@end
