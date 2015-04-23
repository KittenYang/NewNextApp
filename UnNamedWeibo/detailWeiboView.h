//
//  DetailWeiboView.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 4/22/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboModel.h"
#import "MLEmojiLabel.h"

@interface DetailWeiboView : UIView <MLEmojiLabelDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UIImageView *detail_avatar;
@property (strong, nonatomic) IBOutlet UILabel *detail_name;
@property (strong, nonatomic) IBOutlet UILabel *detail_date;
@property (strong, nonatomic) IBOutlet UILabel *detail_source;
@property (strong, nonatomic) IBOutlet MLEmojiLabel *detail_text;


@property (nonatomic,strong)WeiboModel *model_detail;

-(void)setUpDetailWeibo:(WeiboModel *)model;

@end
