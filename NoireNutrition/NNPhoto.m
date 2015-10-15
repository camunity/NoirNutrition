//
//  PCPhoto.m
//  PikCha
//
//  Created by Micah Lanier on 4/7/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import "NNPhoto.h"
#import <Parse/PFObject+Subclass.h>

@implementation NNPhoto

@dynamic photoID;
@dynamic username;
@dynamic comment;
@dynamic date;
@dynamic originalImage;
@dynamic thumbnailImage;
@dynamic rating;
@dynamic user;



+(void)load {
    [self registerSubclass];
}


+(NSString *)parseClassName {
    return @"NNPhoto";
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {

    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
