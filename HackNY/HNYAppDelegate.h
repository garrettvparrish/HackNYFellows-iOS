//
//  HNYAppDelegate.h
//  HackNY
//
//  Created by KyleR on 7/22/14.
//  Copyright (c) 2014 Heartwood Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HNYAppDelegate;

/*!
 *  Gets the global application delegate.
 */
HNYAppDelegate* AppDelegate();

@interface HNYAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// array of year objects
@property NSMutableDictionary *hackNYYears;

@end
