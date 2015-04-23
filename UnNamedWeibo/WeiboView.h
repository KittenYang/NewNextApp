//
//  WeiboView.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/17/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboModel.h"
#import "ReWeiboView.h"
#import "MLEmojiLabel.h"

@interface WeiboView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,MLEmojiLabelDelegate>

@property (strong, nonatomic) IBOutlet MLEmojiLabel *weiboText;
@property (strong, nonatomic) IBOutlet UICollectionView *weiboImageCollectionView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeight;


@property (strong, nonatomic) IBOutlet ReWeiboView *reWeiboView;


//weiboModel
@property (strong,nonatomic)WeiboModel *weiboModel;


@end
