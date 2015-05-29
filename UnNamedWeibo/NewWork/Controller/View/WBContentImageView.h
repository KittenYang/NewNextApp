//
//  WBImageContentView.h
//  Weibo
//
//  Created by SKY on 15/5/26.
//  Copyright (c) 2015年 Sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBContentImageView : UIView

@property(strong,nonatomic)NSMutableArray *urlArray;
@property(strong,nonatomic)UIViewController *containerViewController;


/**
 *  获取高度
 *
 *  @param count
 *
 *  @return
 */
+(float)getContentImageViewHeight:(NSInteger)count;

@end
