//
//  MainTabViewController.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/15/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "MainTabViewController.h"
#import "HomeTableViewController.h"
//#import "UnNamedWeibo-Swift.h"

@interface MainTabViewController ()

@end

@implementation MainTabViewController{
    NSInteger lastVCIndex;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    lastVCIndex = 0;
//    RAMAnimatedTabBarController
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
    NSLog(@"==========================selectedViewController:%ld",lastVCIndex);
    NSLog(@"=========================%ld",item.tag);
    
    if (lastVCIndex == 0 && item.tag == 0) {
        UINavigationController *nav = [self.viewControllers objectAtIndex:0];
        HomeTableViewController *homeVC = [nav.viewControllers objectAtIndex:0];
        [homeVC.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:  YES];
        NSLog(@"========================YES=========================");
    }
    lastVCIndex = item.tag;

}

//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    
//    NSLog(@"==========================viewController:%@",viewController );
//    NSLog(@"==========================selectedIndex:%ld",[tabBarController selectedIndex]);
////    HomeTableViewController *homeTableVC = [[HomeTableViewController alloc]init];
////    if (tabBarController selec && self.tabBarController.selectedIndex == 0) {
////        [homeTableVC.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:  YES];
////    }
//
//}



#pragma tabbarDelegate
//- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
//    if (item.tag == 0 && self.selectedIndex == 0) {
//        //        HomeTableViewController *homeVC = [item.]
//        HomeTableViewController *homeTableVC = [[HomeTableViewController alloc]init];
//        [homeTableVC.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:  YES];
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
