//
//  NNPOCHomeViewController.m
//  NoirNutritionPOC
//
//  Created by Cameron Flowers on 8/29/15.
//  Copyright (c) 2015 incluDe. All rights reserved.
//

#import "NNPOCHomeViewController.h"

@interface NNPOCHomeViewController ()

@end

@implementation NNPOCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)getDataForTimeLineNode{

    //call data from Parse
    //for someElement in dataArray
    //compare array position
    //if even
    [self createRightTimelineNode];
    //save array of Nodes

    //else if false

    [self createLeftTimeLineNode];
    //save array of Nodes
}

- (void)createRightTimelineNode{
    //create the UIView Line
    //create new node
}

-(void)createLeftTimeLineNode{
    //create the UIView Line
    //create new node
}

-(void)displayTimelineNodes{
    //display array of Nodes and UIViews 

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
