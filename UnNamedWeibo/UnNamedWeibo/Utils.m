//
//  Utils.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/18/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(NSString *) WEIBOTOKEN{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"WeiboAuthData"] objectForKey:@"accessToken"];
}

+(NSString *) WEIBOEXDATE{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"WeiboAuthData"] objectForKey:@"expirationDate"];
}

+(NSString *) WEIBOUSERID{
    return  [[[NSUserDefaults standardUserDefaults] objectForKey:@"WeiboAuthData"] objectForKey:@"hostUserID"];
}



// date 格式化为 string
+ (NSString*) stringFromFomate:(NSDate*) date formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

// string 格式化为 date
+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    [formatter setDateFormat:formate];
    NSDate *date = [formatter dateFromString:datestring];
    return date;
}


//格式化日期 : Sat Jan 12 11:50:16 +0800 2013
+ (NSString *)fomateString:(NSString *)datestring {
    NSString *formate = @"EEE MMM d HH:mm:ss Z yyyy";
    NSDate *createDate = [Utils dateFromFomate:datestring formate:formate];
    NSString *text = [Utils stringFromFomate:createDate formate:@"MM-dd HH:mm"];
    return text;
}


//正则表达式
+ (NSString *)parseSource:(NSString *)source{
    NSString *regex = @">\.+<";
    NSArray *array = [source componentsMatchedByRegex:regex];
    if (array.count > 0) {
        //>新浪微博<
        NSString *ret= [array objectAtIndex:0];
        NSRange range;
        range.location = 1;
        range.length = ret.length - 2;
        NSString *resultString = [ret substringWithRange:range];
        return resultString;
    }
    return nil;
}


@end
