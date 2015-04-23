//
//  WeiboModel.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/16/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface WeiboModel : NSObject<NSCoding>

-(id)initWithWeiboDic:(NSDictionary *)dic;

@property (nonatomic,copy  ) NSString     *createDate;//微博的创建时间
@property (nonatomic,copy  ) NSNumber     *weiboId;//微博id
@property (nonatomic,copy  ) NSString     *text;//微博内容
@property (nonatomic,copy  ) NSString     *source;//微博来源
@property (nonatomic,retain) NSNumber     *favorited;//是否已收藏，true：是，false：否
@property (nonatomic,copy  ) NSString     *thumbnailImage;//缩略图片地址，没有时不返回此字段
@property (nonatomic,copy  ) NSString     *bmiddleImage;//中等尺寸图片地址，没有时不返回此字段
@property (nonatomic,copy  ) NSString     *originalImage;//原始图片地址，没有时不返回此字段
@property (nonatomic,retain) NSMutableArray *pic_urls; //微博中多张图片的地址
@property (nonatomic,retain) NSDictionary *geo;//地理信息字段
@property (nonatomic,retain) NSNumber     *repostsCount;//转发数
@property (nonatomic,retain) NSNumber     *commentsCount;//评论数
@property (nonatomic,retain) NSMutableArray *ad; //微博流内的推广微博ID
@property (nonatomic,retain) NSMutableArray *pic_ids;//微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。

@property (nonatomic,retain) WeiboModel   *retWeibo;//被转发的原微博
@property (nonatomic,retain) UserModel    *user;//微博的作者用户


@end
