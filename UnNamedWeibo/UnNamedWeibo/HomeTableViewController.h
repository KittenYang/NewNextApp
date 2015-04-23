//
//  HomeTableViewController.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/13/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"
#import "SKSplashView.h"


@interface HomeTableViewController : BaseTableViewController<SKSplashDelegate>


@property(nonatomic,retain)NSArray *data;   //为tableView提供数据,基本单位是WeiboModel
@property (nonatomic,retain)NSMutableArray *weibos;
@end
