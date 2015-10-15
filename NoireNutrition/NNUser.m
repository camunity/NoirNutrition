//
//  PCUser.m
//  PikCha
//
//  Created by Mick Lerche on 4/7/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import "NNUser.h"
#import <Parse/PFObject+Subclass.h>

@implementation NNUser

@dynamic username;
@dynamic profileImage;
@dynamic firstName;
@dynamic lastName;
@dynamic emailAddress;
@dynamic phoneNumber;
@dynamic gender; 

+ (void)load {
    [self registerSubclass];
}

//+ (NSString *)parseClassName {
//    return @"PFUser";
//}

@end
