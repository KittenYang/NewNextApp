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
    CGFloat lastContentOffsetY;
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
    
    
    UINavigationController *nav = [self.viewControllers objectAtIndex:0];
    HomeTableViewController *homeVC = [nav.viewControllers objectAtIndex:0];
    
//    CGFloat oldTableViewHeight = homeVC.tableView.contentSize.height;
//    CGFloat newTableViewHeight = homeVC.tableView.contentSize.height;
//    homeVC.tableView.contentOffset = CGPointMake(0, newTableViewHeight - oldTableViewHeight);
//    [homeVC.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:updateCount inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];

    
    if (lastVCIndex == 0 && item.tag == 0) {
        if (self.isTop == NO) {
            lastContentOffsetY = homeVC.tableView.contentOffset.y;
        }
    
        if (lastContentOffsetY != homeVC.tableView.contentOffset.y) {
            //返回lastContentOffsetY
            [homeVC.tableView setContentOffset:CGPointMake(0, lastContentOffsetY) animated:YES];

        }else{
            //返回顶部
            [homeVC.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:  YES];
            self.isTop = YES;
        }
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
