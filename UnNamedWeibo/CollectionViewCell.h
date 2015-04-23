//
//  CollectionViewCell.h
//  UnNamedWeibo
//
//  Created by Kitten Yang on 3/5/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLImageView.h"

@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet YLImageView *weiboImage;

@property (strong, nonatomic) IBOutlet UILabel *gifLabel;

@end
