//
//  BaseTableViewController.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/14/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
#import "CONST.h"

@interface BaseTableViewController : UITableViewController<WBHttpRequestDelegate,UIGestureRecognizerDelegate>

@end
