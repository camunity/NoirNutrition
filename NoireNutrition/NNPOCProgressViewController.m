//
//  NNPOCProgressViewController.m
//  NoirNutritionPOC
//
//  Created by Cameron Flowers on 8/29/15.
//  Copyright (c) 2015 incluDe. All rights reserved.
//

#import "NNPOCProgressViewController.h"
#import "NNPhoto.h"
#import "NNUser.h"
#import "NNFeedCollectionViewCell.h"
@interface NNPOCProgressViewController ()

<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
UIGestureRecognizerDelegate,
NNFeedCollectionViewDelegate
>


@property NSMutableArray *feedArray;
@property (weak, nonatomic) IBOutlet UICollectionView *feedCollectionView;
@property UIRefreshControl *refreshControl;

@end

@implementation NNPOCProgressViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.feedArray = [NSMutableArray new];
    self.feedCollectionView.delegate = self;

    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor colorWithRed:0.331 green:0.884 blue:1.000 alpha:1.000];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self action:@selector(loadPhotos) forControlEvents:UIControlEventValueChanged];
    [self.feedCollectionView addSubview:self.refreshControl];
    self.feedCollectionView.alwaysBounceVertical = YES;

    [self loadPhotos];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadPhotos {
    PFQuery *query = [PFQuery queryWithClassName:@"NNPhoto"];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu photos.", (unsigned long)objects.count);
            // Do something with the found objects
            [self.feedArray removeAllObjects];
            for (NNPhoto *object in objects) {
                [self.feedArray addObject:object];
            }
            [self.feedCollectionView reloadData];
            if (self.refreshControl) {
                [self.refreshControl endRefreshing];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.feedCollectionView.frame.size.width, self.feedCollectionView.frame.size.height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NNFeedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    cell.delegate = self;
    cell.cellNumber = indexPath.row;

    NSDateFormatter* dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"MMM dd, yyyy hh:mm a"];
    NSString *photoTime = [dateFormatter stringFromDate:[self.feedArray[indexPath.row] createdAt]];
    cell.timeStampLabel.text = photoTime;


    PFFile *usersPhoto = [self.feedArray[indexPath.row] originalImage];
    [usersPhoto getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            cell.cellImageView.image = [UIImage imageWithData:imageData];
            [cell layoutSubviews];
        }
    }];

    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NNFeedCollectionViewCell *cell = (NNFeedCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"YOU SELECT ME?");
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.feedArray.count;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
