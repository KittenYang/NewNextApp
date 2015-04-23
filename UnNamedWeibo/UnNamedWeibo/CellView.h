//
//  CellView.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/17/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboModel.h"
#import "WeiboView.h"

@interface CellView : UIView

@property (strong, nonatomic) IBOutlet UILabel *createDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *sourceLabel;
@property (strong, nonatomic) IBOutlet WeiboView *weiboView;

//weiboModel
@property (strong,nonatomic)WeiboModel *weiboModel;

@end
