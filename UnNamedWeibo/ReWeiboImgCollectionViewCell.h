//
//  ReWeiboImgCollectionViewCell.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 3/6/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLImageView.h"

@interface ReWeiboImgCollectionViewCell : UICollectionViewCell


@property (strong, nonatomic) IBOutlet YLImageView *reWeiboImage;

@property (strong, nonatomic) IBOutlet UILabel *reGifLabel;

@end
