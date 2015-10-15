//
//  PCPhoto.h
//  PikCha
//
//  Created by Micah Lanier on 4/7/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import <Parse/Parse.h>
#import "NNUser.h"

@interface NNPhoto : PFObject <PFSubclassing>

+(NSString *)parseClassName;

@property NSString *photoID;
@property NSString *username;
@property NSString *comment;
@property NSDate *date;
@property PFFile *originalImage;
@property PFFile *thumbnailImage;
@property NNUser *user;
@property int rating;


+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;


@end
