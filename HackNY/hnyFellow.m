//
//  Users.m
//  HackNY
//
//  Created by KyleR on 7/30/14.
//  Copyright (c) 2014 HackNY All rights reserved.
//

#import "hnyFellow.h"
#import <Parse/Parse.h>

@implementation hnyFellow

+ (hnyFellow *)configureUserWithPFObject:(PFObject *)object {
    hnyFellow *user = [[hnyFellow alloc] init];
    user.objectID = object.objectId;
    user.school = object[@"school"];
    user.company = object[@"company"];
    user.q1 = object[@"q1"];
    return user;
}

@end
