//
//  hnyAppDelegate.h
//  HackNY
//
//  Created by KyleR on 7/22/14.
//  Copyright (c) 2014 HackNY All rights reserved.
//

#import <UIKit/UIKit.h>

@class hnyAppDelegate;

/*!
 *  Gets the global application delegate.
 */
hnyAppDelegate* AppDelegate();

@interface hnyAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// array of year objects
@property NSMutableDictionary *hackNYYears;

- (UIColor *)mainColor;
- (UIColor *)lightMainColor;
- (NSNumber *)currentYear;
- (NSNumber *)numberOfYearsOfHackNY;
- (NSMutableArray *)arrayOfYears;

@end
