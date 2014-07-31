//
//  Users.m
//  HackNY
//
//  Created by KyleR on 7/30/14.
//  Copyright (c) 2014 Heartwood Labs. All rights reserved.
//

#import "User.h"
#import <Parse/Parse.h>

@implementation User

+ (User *)configureUserWithPFObject:(PFObject *)object {
    User *user = [[User alloc] init];
    user.objectID = object.objectId;
    user.school = object[@"school"];
    user.company = object[@"company"];
    user.q1 = object[@"q1"];
    return user;
}

@end
