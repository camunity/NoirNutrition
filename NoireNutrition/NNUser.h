//
//  PCUser.h
//  PikCha
//
//  Created by Mick Lerche on 4/7/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import <Parse/Parse.h>

@interface NNUser : PFUser <PFSubclassing>

@property NSString *firstName;
@property NSString *lastName;
@property NSString *emailAddress;
@property PFFile *profileImage;
@property NSString *phoneNumber;
@property NSString *gender;


//+ (NSString *)parseClassName;


@end
