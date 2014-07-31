//
//  hnyFellow.h
//  HackNY
//
//  Created by KyleR on 7/30/14.
//  Copyright (c) 2014 HackNY All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface hnyFellow : NSObject

@property (nonatomic, retain) NSString *objectID;
@property (nonatomic, retain) NSString *school;
@property (nonatomic, retain) NSString *company;
@property (nonatomic, retain) NSString *q1;

+ (hnyFellow *)configureUserWithPFObject:(PFObject *)object;

@end
