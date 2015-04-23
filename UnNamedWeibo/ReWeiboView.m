//
//  ReWeiboView.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 3/6/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

typedef enum ScrollDirection {
    ScrollDirectionNone,
    ScrollDirectionRight,
    ScrollDirectionLeft,
    ScrollDirectionUp,
    ScrollDirectionDown,
    ScrollDirectionCrazy,
} ScrollDirection;



#import "ReWeiboView.h"
#import "UIImageView+WebCache.h"
#import "ReWeiboImgCollectionViewCell.h"

@implementation ReWeiboView{

    CGFloat lastContentOffset;
    
}

-(void)awakeFromNib{
    self.reWeiboImageCollectionView.dataSource  = self;
    self.reWeiboImageCollectionView.delegate    = self;
    self.reWeiboText.isNeedAtAndPoundSign = YES;
    self.reWeiboText.disableEmoji = NO;
    self.reWeiboText.delegate = self;
    self.reWeiboText.customEmojiPlistName = @"EMOTION.plist";
    self.reWeiboText.customEmojiRegex = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
    self.reWeiboText.font =[UIFont systemFontOfSize:15.0f];
    
}

//-(void)layoutSubviews{
//    [super layoutSubviews];
////    [self.reWeiboImageCollectionView.collectionViewLayout invalidateLayout];
//    if (self.reWeiboModel.pic_urls.count > 0) {
//        [self.reWeiboImageCollectionView reloadData];
//    }
//}

-(void)setReWeiboModel:(WeiboModel *)reWeiboModel{
    if (_reWeiboModel != reWeiboModel) {
        _reWeiboModel = reWeiboModel;
    }
    if (reWeiboModel.pic_urls.count > 0) {

//        [_reWeiboImageCollectionView reloadData];
        
    }else{
        return;
    }
}

#pragma mark - MLEmojiLabelDelegate
- (void)mlEmojiLabel:(MLEmojiLabel*)emojiLabel didSelectLink:(NSString*)link withType:(MLEmojiLabelLinkType)type{
    
    switch(type){
        case MLEmojiLabelLinkTypeURL:
            NSLog(@"点击了链接%@",link);
            break;
        case MLEmojiLabelLinkTypePhoneNumber:
            NSLog(@"点击了电话%@",link);
            break;
        case MLEmojiLabelLinkTypeEmail:
            NSLog(@"点击了邮箱%@",link);
            break;
        case MLEmojiLabelLinkTypeAt:
            NSLog(@"点击了用户%@",link);
            break;
        case MLEmojiLabelLinkTypePoundSign:
            NSLog(@"点击了话题%@",link);
            break;
        default:
            NSLog(@"点击了不知道啥%@",link);
            break;
    }
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (self.reWeiboModel.pic_urls.count == 0) {
        return 0;
    }
    return [self.reWeiboModel.pic_urls count];
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.reWeiboModel.pic_urls.count > 0) {
        ReWeiboImgCollectionViewCell *cell = (ReWeiboImgCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"reWeibo_image_cell" forIndexPath:indexPath];

        NSMutableArray *bmiddle_pic_urls = [NSMutableArray arrayWithCapacity:self.reWeiboModel.pic_urls.count];
        for (NSInteger i = 0; i < self.reWeiboModel.pic_urls.count; i++) {
            NSString *thumbnailImageUrl = [self.reWeiboModel.pic_urls[i] objectForKey:@"thumbnail_pic"];
            if (![thumbnailImageUrl hasSuffix:@".gif"]) {
                
                thumbnailImageUrl = [thumbnailImageUrl stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
                
            }

            NSDictionary *imgdics = [NSDictionary dictionaryWithObjectsAndKeys:thumbnailImageUrl,@"thumbnail_pic", nil];
            [bmiddle_pic_urls addObject:imgdics];
        }
        self.reWeiboModel.pic_urls = bmiddle_pic_urls;
        

        if (indexPath.item < self.reWeiboModel.pic_urls.count) {
        
            NSDictionary *imgDICS = self.reWeiboModel.pic_urls[indexPath.item];
            NSString *imgUrl = [imgDICS objectForKey:@"thumbnail_pic"];
            NSURL *photoUrl = [NSURL URLWithString:imgUrl];
  
            if ([imgUrl hasSuffix:@".gif"]) {
                cell.reGifLabel.hidden = NO;
            }else{
                cell.reGifLabel.hidden = YES;
            }

            
            [cell.reWeiboImage sd_setImageWithURL:photoUrl placeholderImage:[UIImage imageNamed:@"placeholderImg_white"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                NSLog(@"图片下载进度 = %f", (float)receivedSize/(float)expectedSize );
            } completed:^(UIImage *image, NSData *data, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error) {
                    NSLog(@"ERROR: %@", error);
                } else {
                    
                }
            }];
            
//            [cell.reWeiboImage sd_setImageWithURL:photoUrl placeholderImage:[UIImage imageNamed:@"placeholderImg"]];
        }
    
        return cell;
        
    }else{
        
        return nil;
    }
    
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (self.reWeiboModel.pic_urls.count == 1) {
//        
//        cell.frame = CGRectMake(0, 5, collectionView.bounds.size.width, 190);
//        
//    }else{
//        if (indexPath.item == 0) {
//            cell.frame = CGRectMake(0, 5, 190, 190);
//        }
//    }
    
    
    ScrollDirection scrollDirection;
    if (lastContentOffset > collectionView.contentOffset.x)
        scrollDirection = ScrollDirectionLeft;
    else if (lastContentOffset < collectionView.contentOffset.x)
        scrollDirection = ScrollDirectionRight;
    lastContentOffset = collectionView.contentOffset.x;
    
    
    if (scrollDirection == ScrollDirectionRight && collectionView.contentOffset.x > 0) {
        CGPoint offsetPositioning = CGPointMake(40, 0);
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y , 0.0);
        cell.layer.transform = transform;
        
        [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.6f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            cell.layer.transform = CATransform3DIdentity;
            
        } completion:nil];
    }else{
        return;
    }
    
}


@end
