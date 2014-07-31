//
//  Users.h
//  HackNY
//
//  Created by KyleR on 7/30/14.
//  Copyright (c) 2014 Heartwood Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface HNFellow : NSObject

@property (nonatomic, retain) NSString *objectID;
@property (nonatomic, retain) NSString *school;
@property (nonatomic, retain) NSString *company;
@property (nonatomic, retain) NSString *q1;

+ (HNFellow *)configureUserWithPFObject:(PFObject *)object;

@end
