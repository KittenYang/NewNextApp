//
//  WeiboModel.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/16/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "WeiboModel.h"

@implementation WeiboModel

-(id)initWithWeiboDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setUpWeiboData:dic];

    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.createDate = [aDecoder decodeObjectForKey:@"createDate"];
        self.weiboId = [aDecoder decodeObjectForKey:@"weiboId"];
        self.text = [aDecoder decodeObjectForKey:@"text"];
        self.source = [aDecoder decodeObjectForKey:@"source"];
        self.favorited = [aDecoder decodeObjectForKey:@"favorited"];
        self.thumbnailImage = [aDecoder decodeObjectForKey:@"thumbnailImage"];
        self.bmiddleImage = [aDecoder decodeObjectForKey:@"bmiddleImage"];
        self.originalImage = [aDecoder decodeObjectForKey:@"originalImage"];
        self.pic_urls      = [aDecoder decodeObjectForKey:@"pic_urls"];
        self.geo = [aDecoder decodeObjectForKey:@"geo"];
        self.geo = [aDecoder decodeObjectForKey:@"repostsCount"];
        self.geo = [aDecoder decodeObjectForKey:@"commentsCount"];

        
        WeiboModel *retweetWeiboModel = [aDecoder decodeObjectForKey:@"retWeibo"];;
        if (retweetWeiboModel != nil) {
            self.retWeibo = retweetWeiboModel;
        }
        
        UserModel *userModel = [aDecoder decodeObjectForKey:@"user"];
        if (userModel != nil) {
            self.user = userModel;
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.createDate    forKey:@"createDate"];
    [aCoder encodeObject:self.weiboId forKey:@"weiboId"];
    [aCoder encodeObject:self.text    forKey:@"text"];
    [aCoder encodeObject:self.source    forKey:@"source"];
    [aCoder encodeObject:self.favorited    forKey:@"favorited"];
    [aCoder encodeObject:self.thumbnailImage    forKey:@"thumbnailImage"];
    [aCoder encodeObject:self.bmiddleImage    forKey:@"bmiddleImage"];
    [aCoder encodeObject:self.originalImage    forKey:@"originalImage"];
    [aCoder encodeObject:self.pic_urls forKey:@"pic_urls"];
    [aCoder encodeObject:self.geo    forKey:@"geo"];
    [aCoder encodeObject:self.repostsCount    forKey:@"repostsCount"];
    [aCoder encodeObject:self.commentsCount    forKey:@"commentsCount"];
    [aCoder encodeObject:self.retWeibo    forKey:@"retWeibo"];
    [aCoder encodeObject:self.user    forKey:@"user"];
}




-(void)setUpWeiboData:(NSDictionary *)dic{
    self.createDate = [dic objectForKey:@"created_at"];
    self.weiboId = [dic objectForKey:@"id"];
    self.text = [dic objectForKey:@"text"];
    self.source = [dic objectForKey:@"source"];
    self.favorited = [dic objectForKey:@"favorited"];
    self.thumbnailImage = [dic objectForKey:@"thumbnail_pic"];
    self.bmiddleImage = [dic objectForKey:@"bmiddle_pic"];
    self.originalImage = [dic objectForKey:@"original_pic"];
    self.pic_urls = [dic objectForKey:@"pic_urls"];
    self.geo = [dic objectForKey:@"geo"];
    self.repostsCount = [dic objectForKey:@"reposts_count"];
    self.commentsCount = [dic objectForKey:@"comments_count"];
    
    NSDictionary *retweetDic = [dic objectForKey:@"retweeted_status"];
    if (retweetDic != nil) {
        WeiboModel *relWeibo = [[WeiboModel alloc] initWithWeiboDic:retweetDic];
        self.retWeibo = relWeibo;
    }
    
    NSDictionary *userDic = [dic objectForKey:@"user"];
    if (userDic != nil) {
        UserModel *user = [[UserModel alloc] initWithUserDic:userDic];
        self.user = user;
    }
}
@end
