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

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.idstr             = [aDecoder decodeObjectForKey:@"idstr"];
        self.screen_name       = [aDecoder decodeObjectForKey:@"screen_name"];
        self.name              = [aDecoder decodeObjectForKey:@"name"];
        self.location          = [aDecoder decodeObjectForKey:@"location"];
        self.user_description  = [aDecoder decodeObjectForKey:@"description"];
        self.url               = [aDecoder decodeObjectForKey:@"url"];
        self.profile_image_url = [aDecoder decodeObjectForKey:@"profile_image_url"];
        self.avatar_large      = [aDecoder decodeObjectForKey:@"avatar_large"];
        self.gender            = [aDecoder decodeObjectForKey:@"gender"];
        self.followers_count   = [aDecoder decodeObjectForKey:@"followers_count"];
        self.friends_count     = [aDecoder decodeObjectForKey:@"friends_count"];
        self.statuses_count    = [aDecoder decodeObjectForKey:@"statuses_count"];
        self.favourites_count  = [aDecoder decodeObjectForKey:@"favourites_count"];
        self.verified          = [aDecoder decodeObjectForKey:@"verified"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.idstr    forKey:@"idstr"];
    [aCoder encodeObject:self.screen_name forKey:@"screen_name"];
    [aCoder encodeObject:self.name    forKey:@"name"];
    [aCoder encodeObject:self.location    forKey:@"location"];
    [aCoder encodeObject:self.user_description    forKey:@"user_description"];
    [aCoder encodeObject:self.url    forKey:@"url"];
    [aCoder encodeObject:self.profile_image_url    forKey:@"profile_image_url"];
    [aCoder encodeObject:self.avatar_large    forKey:@"avatar_large"];
    [aCoder encodeObject:self.gender    forKey:@"gender"];
    [aCoder encodeObject:self.followers_count    forKey:@"followers_count"];
    [aCoder encodeObject:self.friends_count    forKey:@"friends_count"];
    [aCoder encodeObject:self.statuses_count    forKey:@"statuses_count"];
    [aCoder encodeObject:self.favourites_count    forKey:@"favourites_count"];
    [aCoder encodeObject:self.verified    forKey:@"verified"];
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
