//
//  WeiboView.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/17/15.
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



#import "WeiboView.h"
#import "UIImageView+WebCache.h"
#import "CollectionViewCell.h"
#import "IDMPhoto.h"
#import "IDMPhotoBrowser.h"


@interface WeiboView()<IDMPhotoBrowserDelegate>

@end

@implementation WeiboView{

    CGFloat lastContentOffset;
}


-(void)awakeFromNib{

    self.weiboImageCollectionView.dataSource  = self;
    self.weiboImageCollectionView.delegate    = self;
    self.weiboText.isNeedAtAndPoundSign = YES;
    self.weiboText.disableEmoji = NO;
    self.weiboText.delegate = self;
    self.weiboText.customEmojiPlistName = @"EMOTIONS.plist";
    self.weiboText.customEmojiRegex = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
    self.weiboText.font =[UIFont systemFontOfSize:16.0f];
    
    self.weiboImageCollectionView.scrollsToTop = NO;
    
}


//-(void)layoutSubviews{
//    [super layoutSubviews];
////    [self.weiboImageCollectionView.collectionViewLayout invalidateLayout];
//}

-(void)setWeiboModel:(WeiboModel *)weiboModel{
    if (_weiboModel != weiboModel) {
        _weiboModel = weiboModel;
    }
    
    if (weiboModel.pic_urls.count > 0) {
        
//        [_weiboImageCollectionView reloadData];
    }
}

#pragma  mark  - MLEmojiLabelDelegate
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


    return [self.weiboModel.pic_urls count];
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{


    if (self.weiboModel.pic_urls > 0) {

        CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"weibo_image_cell" forIndexPath:indexPath];

        if (indexPath.row < self.weiboModel.pic_urls.count) {
            
            NSMutableArray *bmiddle_pic_urls = [NSMutableArray arrayWithCapacity:self.weiboModel.pic_urls.count];
            for (NSInteger i = 0; i < self.weiboModel.pic_urls.count; i++) {
                NSString *thumbnailImageUrl = [self.weiboModel.pic_urls[i] objectForKey:@"thumbnail_pic"];
                if (![thumbnailImageUrl hasSuffix:@".gif"]) {
                    thumbnailImageUrl = [thumbnailImageUrl stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
                }
                
                NSDictionary *imgdics = [NSDictionary dictionaryWithObjectsAndKeys:thumbnailImageUrl,@"thumbnail_pic", nil];
                [bmiddle_pic_urls addObject:imgdics];
            }
            self.weiboModel.pic_urls = bmiddle_pic_urls;
            
            
            NSDictionary *imgDICS = self.weiboModel.pic_urls[indexPath.item];
            NSString *imgUrl = [imgDICS objectForKey:@"thumbnail_pic"];
            NSURL *photoUrl = [NSURL URLWithString:imgUrl];
            if ([imgUrl hasSuffix:@".gif"]) {
                cell.gifLabel.hidden = NO;
            }else{
                cell.gifLabel.hidden = YES;
            }
            
            
            
            [cell.weiboImage sd_setImageWithURL:photoUrl placeholderImage:[UIImage imageNamed:@"placeholderImg_gray"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                NSLog(@"图片下载进度 = %f", (float)receivedSize/(float)expectedSize );
            } completed:^(UIImage *image, NSData *data, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error) {
                    NSLog(@"ERROR: %@", error);
                } else {
                    
                }
            }];
//            [cell.weiboImage sd_setImageWithURL:photoUrl placeholderImage:[UIImage imageNamed:@"placeholderImg"]];
            
        }
        return cell;
        
    }else{
        
        return nil;
    }
    
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    NSMutableArray *photos = [NSMutableArray new];//图片地址的数组
    for (NSDictionary *picUrlDic in self.weiboModel.pic_urls) {
        NSString *picUrl = [picUrlDic objectForKey:@"thumbnail_pic"];
        [photos addObject:picUrl];
    }
    
    NSArray *photosWithURL = [IDMPhoto photosWithURLs:photos];//photos objects的数组
    
    IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotos:photosWithURL animatedFromView:cell];
    browser.delegate = self;
    browser.displayActionButton = NO;
    browser.displayArrowButton = YES;
    browser.displayCounterLabel = YES;
    browser.usePopAnimation = YES;
    browser.scaleImage = cell.weiboImage.image;
    [browser setInitialPageIndex:indexPath.item];
    
    [self.photoBrowser presentViewController:browser animated:YES completion:nil];
    
    
}



- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
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
