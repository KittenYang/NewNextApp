//
//  AppDelegate.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/12/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CONST.h"
#import "WeiboSDK.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,WeiboSDKDelegate>

@property (strong, nonatomic) UIWindow *window;
//---weiboAuthInfo--
@property (strong, nonatomic) NSString *wbtoken;
@property (strong,nonatomic) NSDate  *wbexpirationdate;
@property (strong,nonatomic) NSString  *wbuserid;

@end

