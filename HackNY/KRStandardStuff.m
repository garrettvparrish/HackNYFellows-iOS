//
//  KRStandardAppearance.m
//  HackNY
//
//  Created by KyleR on 7/30/14.
//  Copyright (c) 2014 Heartwood Labs. All rights reserved.
//

#import "KRStandardStuff.h"

@implementation KRStandardStuff

+ (UIColor *)mainColor {
    return [UIColor colorWithRed:0.933 green:0.231 blue:0.165 alpha:1];
}
+ (UIColor *)lightMainColor {
    return [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
}
+ (NSNumber *)currentYear {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *yearString = [formatter stringFromDate:[NSDate date]];
    NSNumber *number = [NSNumber numberWithInteger:[yearString integerValue]];
    return number;
}
+ (NSNumber *)numberOfYearsOfHackNY {
    NSNumber *numberOfYearsOfHackNY = [NSNumber numberWithInt:[[KRStandardStuff currentYear] intValue] - 2010];
    return numberOfYearsOfHackNY;
}
+ (NSMutableArray *)arrayOfYears {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = [[KRStandardStuff currentYear] intValue]; i >= 2011; i--) {
        [array addObject:[NSString stringWithFormat:@"%i", i]];
    }
    return array;
}

@end
