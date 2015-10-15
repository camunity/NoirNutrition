//
//  NNPOCCameraViewController.m
//  NoirNutritionPOC
//
//  Created by Cameron Flowers on 8/29/15.
//  Copyright (c) 2015 incluDe. All rights reserved.
//

#import "NNPOCCameraViewController.h"
#import "NNUser.h"
#import "NNPhoto.h"
#import <TGCameraViewController.h>

@interface NNPOCCameraViewController () <TGCameraDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) IBOutlet UITextView *commentTextView;

@end

@implementation NNPOCCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showCamera];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showCamera{
    TGCameraNavigationController *navigationController =
    [TGCameraNavigationController newWithCameraDelegate:self];
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - TGCameraDelegate required

- (void)cameraDidCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cameraDidTakePhoto:(UIImage *)image
{
    self.photoView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cameraDidSelectAlbumPhoto:(UIImage *)image
{
    self.photoView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)uploadPicture:(id)sender{

    NNUser *user = (NNUser *)[PFUser currentUser];
    NNPhoto *photo = [NNPhoto new];

    UIImage *myIcon2 = [NNPhoto imageWithImage:self.photoView.image scaledToSize:CGSizeMake(self.photoView.image.size.width/4, self.photoView.image.size.height/4)];

    NSData *imageData2 = UIImagePNGRepresentation(myIcon2);
    PFFile *imageFile2 = [PFFile fileWithName:@"image2.png" data:imageData2];
    photo.originalImage = imageFile2;
    photo.comment = self.commentTextView.text;
    photo.username = user.username;
    photo.user = user;
    [photo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Hooray! We're Saved a Photo");
        } else {
            NSLog(@"%@", error);
        }
    }];

//    //Segue to Feed VC
//    [self.tabBarController setSelectedIndex:0];
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
