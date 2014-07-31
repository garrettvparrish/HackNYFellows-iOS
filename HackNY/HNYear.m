//
//  HNYear.m
//  HackNY
//
//  Created by KyleR on 7/30/14.
//  Copyright (c) 2014 Heartwood Labs. All rights reserved.
//

#import "HNYear.h"
#import <Parse/Parse.h>

@implementation HNYear

- (id) initWithFellows: (NSMutableArray *) fellows {
    self = [super init];
    if (self) {
        self.fellows = fellows;
    }
    return self;
}

@end
