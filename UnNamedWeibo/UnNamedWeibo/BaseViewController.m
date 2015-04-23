//
//  BaseViewController.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/14/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage* logo = [UIImage imageNamed:@"Woohu"];
    CGRect frameimg = CGRectMake(0, 0, 70, 30);
    UIButton *logoButton = [[UIButton alloc] initWithFrame:frameimg];
    [logoButton setImage:logo forState:UIControlStateNormal];
    logoButton.imageEdgeInsets = UIEdgeInsetsMake(0, -6, 4, 0);
    logoButton.adjustsImageWhenHighlighted = NO;
    
    UIBarButtonItem *logoItem =[[UIBarButtonItem alloc] initWithCustomView:logoButton];
    self.navigationItem.leftBarButtonItem=logoItem;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
