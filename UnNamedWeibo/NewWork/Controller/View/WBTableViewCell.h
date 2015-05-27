//
//  TableViewCell.h
//  Weibo
//
//  Created by SKY on 15/5/26.
//  Copyright (c) 2015年 Sky. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WBTableViewCell : UITableViewCell

@property(strong,nonatomic)WBHomeCellViewModel *homeCellViewModel;


/**
 *  获取行的高度
 *
 *  @param homeCellViewModel
 *
 *  @return
 */
+(float)getHeight:(WBHomeCellViewModel *)homeCellViewModel;

-(void)clear;
@end
