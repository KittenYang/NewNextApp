//
//  DetailViewController.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 3/15/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "BaseTableViewController.h"
#import "detailWeiboView.h"

@interface DetailViewController : BaseTableViewController

@property (nonatomic,strong)DetailWeiboView *detailWeiboView;
@property (nonatomic,strong)WeiboModel *model;

@end
