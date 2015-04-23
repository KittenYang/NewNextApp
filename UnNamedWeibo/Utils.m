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

//正则表达式解析高亮字符
//+ (NSString *)parseLink:(NSString *)text{
//    NSString *regex = @"(@[\\u4e00-\\u9fa5\\w\\-]+)|(http(s)?://([a-zA-Z|\\d]+\\.)+[a-zA-Z|\\d]+(/[a-zA-Z|\\d|\\-|\\+|_./?%&=]*)?)|(#([^\\#|.]+)#)|(\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\])";
//    NSArray *matchArray = [text componentsMatchedByRegex:regex];
//    for (NSString *linkString in matchArray) {
//        
//        NSString *replacing = nil;
//        if ([linkString hasPrefix:@"@"]) {   //hasPrefix 方法作用：判断以哪个字符串开头
//            replacing = [NSString stringWithFormat:@"<a href='user://%@'>%@</a>",[linkString URLEncodedString],linkString];
//        }else if([linkString hasPrefix:@"http"]){
//            replacing = [NSString stringWithFormat:@"<a href='%@'>%@</a>",linkString,linkString];
//        }else if([linkString hasPrefix:@"#"]){
//            replacing = [NSString stringWithFormat:@"<a href='topic://%@'>%@</a>",[linkString URLEncodedString],linkString];
//        }
//        if (replacing != nil) {
//            text = [text stringByReplacingOccurrencesOfString:linkString withString:replacing];
//        }
//    }
//    return text;
//}


@end
