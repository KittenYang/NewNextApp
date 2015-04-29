//
//  BaseTableViewController.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/14/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
#import "ACTimeScroller.h"
#import "CONST.h"

@protocol loadMoreDelegate <NSObject>

//下拉
- (void)pullDown;
//上拉
- (void)pullUp;


@end


@interface BaseTableViewController : UITableViewController<WBHttpRequestDelegate,UIGestureRecognizerDelegate>


@property (nonatomic,assign ) id<loadMoreDelegate> loademoredelegate;
@property (strong, nonatomic) NSMutableArray   *showIndexes;//保存已显示的cell的indexpath
@property (strong, nonatomic) NSMutableArray   *afterRemovedshowIndexes;//保存已显示的cell的indexpath
@property (assign,nonatomic ) BOOL             isFirstTime;
@property (nonatomic,assign) BOOL  isNeedScrollBarIndicator;
@property (nonatomic,strong) ACTimeScroller *timeScroller;


-(void)backToTop;//停止刷新，回到顶部
@end
