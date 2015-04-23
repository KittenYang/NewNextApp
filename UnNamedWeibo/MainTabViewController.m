//
//  MainTabViewController.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/15/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "MainTabViewController.h"
#import "UnNamedWeibo-Swift.h"

@interface MainTabViewController ()

@end

@implementation MainTabViewController
-(id)init{
    self = [super init];
    if (self) {
        self = [[RAMAnimatedTabBarController alloc]init];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self = [[RAMAnimatedTabBarController alloc]init];
    }
    return self;
}
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self = [[RAMAnimatedTabBarController alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    RAMAnimatedTabBarController
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
