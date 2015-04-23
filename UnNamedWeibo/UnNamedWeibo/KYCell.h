//
//  KYCell.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/15/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellView.h"
#import "WeiboModel.h"


@interface KYCell : UITableViewCell

@property(nonatomic,strong)CAShapeLayer * verticalLine;
@property(nonatomic,strong)UIPanGestureRecognizer *sgr;

//subviews
@property (strong, nonatomic) IBOutlet CellView *cellView;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIImageView *avator;


//weiboModel
@property (strong,nonatomic)WeiboModel *weiboModel;

@end
