//
//  PCFeedCollectionViewCell.h
//  PikCha
//
//  Created by Micah Lanier on 4/8/15.
//  Copyright (c) 2015 Micah Lanier Design and Illustration. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNFeedCollectionViewDelegate <NSObject>

- (void)showSegue:(NSInteger)cellNumber;

@end

@interface NNFeedCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;
@property NSInteger cellNumber;
@property (nonatomic, assign) id <NNFeedCollectionViewDelegate> delegate;

- (void) animateLike;


@end
