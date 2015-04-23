//
//  Utils.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/18/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegexKitLite.h"


@interface Utils : NSObject

+(NSString *) WEIBOTOKEN;
+(NSDate *) WEIBOEXDATE;
+(NSString *) WEIBOUSERID;

// date 格式化为 string
+ (NSString*) stringFromFomate:(NSDate*)date formate:(NSString*)formate;
// string 格式化为 date
+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate;
//格式化日期
+ (NSString *)fomateString:(NSString *)datestring;

//正则表达式
+ (NSString *)parseSource:(NSString *)source;

@end
