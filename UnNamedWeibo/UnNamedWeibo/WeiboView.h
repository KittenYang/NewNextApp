//
//  WeiboView.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/17/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboModel.h"

@interface WeiboView : UIView

@property (strong, nonatomic) IBOutlet UILabel *weiboText;


//weiboModel
@property (strong,nonatomic)WeiboModel *weiboModel;

+(CGFloat)getWeiboHeight:(WeiboModel *)model;

@end
