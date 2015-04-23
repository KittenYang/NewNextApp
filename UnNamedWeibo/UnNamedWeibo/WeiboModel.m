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


-(void)setUpWeiboData:(NSDictionary *)dic{
    self.createDate = [dic objectForKey:@"created_at"];
    self.weiboId = [dic objectForKey:@"id"];
    self.text = [dic objectForKey:@"text"];
    self.source = [dic objectForKey:@"source"];
    self.favorited = [dic objectForKey:@"favorited"];
    self.thumbnailImage = [dic objectForKey:@"thumbnail_pic"];
    self.bmiddleImage = [dic objectForKey:@"bmiddle_pic"];
    self.originalImage = [dic objectForKey:@"original_pic"];
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
