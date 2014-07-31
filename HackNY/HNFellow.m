//
//  Users.m
//  HackNY
//
//  Created by KyleR on 7/30/14.
//  Copyright (c) 2014 Heartwood Labs. All rights reserved.
//

#import "HNFellow.h"
#import <Parse/Parse.h>

@implementation HNFellow

+ (HNFellow *)configureUserWithPFObject:(PFObject *)object {
    HNFellow *user = [[HNFellow alloc] init];
    user.objectID = object.objectId;
    user.school = object[@"school"];
    user.company = object[@"company"];
    user.q1 = object[@"q1"];
    return user;
}

@end
