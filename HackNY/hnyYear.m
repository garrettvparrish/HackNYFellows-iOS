//
//  HNYear.m
//  HackNY
//
//  Created by KyleR on 7/30/14.
//  Copyright (c) 2014 HackNY All rights reserved.
//

#import "hnyYear.h"
#import <Parse/Parse.h>

@implementation hnyYear

- (id) initWithFellows: (NSMutableArray *) fellows {
    self = [super init];
    if (self) {
        self.fellows = fellows;
    }
    return self;
}

@end
