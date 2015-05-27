//
//  WBLocalEmotionModel.h
//  Weibo
//
//  Created by SKY on 15/5/25.
//  Copyright (c) 2015年 Sky. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  plist本地表情实体
 */
@interface WBLocalEmotionModel : NSObject
@property (nonatomic,copy) NSString* code;//表情编码
@property (nonatomic,copy) NSString* urlPath;//表情地址
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
