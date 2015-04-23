//
//  UserModel.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/16/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(id)initWithUserDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setUpUserData:dic];
    }
    return self;
}

-(void)setUpUserData:(NSDictionary *)dic{
    self.idstr             = [dic objectForKey:@"idstr"];
    self.screen_name       = [dic objectForKey:@"screen_name"];
    self.name              = [dic objectForKey:@"name"];
    self.location          = [dic objectForKey:@"location"];
    self.user_description  = [dic objectForKey:@"description"];
    self.url               = [dic objectForKey:@"url"];
    self.profile_image_url = [dic objectForKey:@"profile_image_url"];
    self.avatar_large      = [dic objectForKey:@"avatar_large"];
    self.gender            = [dic objectForKey:@"gender"];
    self.followers_count   = [dic objectForKey:@"followers_count"];
    self.friends_count     = [dic objectForKey:@"friends_count"];
    self.statuses_count    = [dic objectForKey:@"statuses_count"];
    self.favourites_count  = [dic objectForKey:@"favourites_count"];
    self.verified          = [dic objectForKey:@"verified"];
}

@end
