//
//  DetailWeiboView.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 4/22/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "DetailWeiboView.h"
#import "UIImageView+WebCache.h"
#import "UIView+Extra.h"
#import "Utils.h"
#import "CONST.h"

@interface DetailWeiboView()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *detail_text_height;


@end
@implementation DetailWeiboView{
    UIView *retWeiboDetailView;
}

-(void)awakeFromNib{
    
    self.detail_avatar.layer.cornerRadius = self.detail_avatar.bounds.size.width/2;
    self.detail_text.isNeedAtAndPoundSign = YES;
    self.detail_text.disableEmoji = NO;
    self.detail_text.delegate = self;
    self.detail_text.customEmojiPlistName = @"EMOTION.plist";
    self.detail_text.customEmojiRegex = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
    self.detail_text.font =[UIFont systemFontOfSize:16.0f];
    
}


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

#pragma mark -- 解决手势冲突
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    UIView *gestureView = [gestureRecognizer view];
    CGPoint translation = [gestureRecognizer translationInView:[gestureView superview]];
    
    //只有水平方向的距离绝对值 大于 垂直方向的距离绝对值 才能触发
    if (fabsf(translation.x) > fabsf(translation.y) || (fabsf(translation.x) == 0 && fabsf(translation.y) == 0))
    {
        return YES;
    }
    
    return NO;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (self.model_detail.retWeibo.pic_urls.count > 0) {
        return [self.model_detail.retWeibo.pic_urls count];
    }else{
        return [self.model_detail.pic_urls count];
    }
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //非转发微博，带图片
    if (self.model_detail.pic_urls.count > 0) {
        
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"detail_Img_Cell" forIndexPath:indexPath];
        UIImageView *cellImage = [[UIImageView alloc]initWithFrame:cell.bounds];
        cellImage.contentMode = UIViewContentModeScaleAspectFill;
        cellImage.clipsToBounds = YES;
        [cell.contentView addSubview:cellImage];
        
        if (indexPath.row < self.model_detail.pic_urls.count) {
            
            NSMutableArray *bmiddle_pic_urls = [NSMutableArray arrayWithCapacity:self.model_detail.pic_urls.count];
            for (NSInteger i = 0; i < self.model_detail.pic_urls.count; i++) {
                NSString *thumbnailImageUrl = [self.model_detail.pic_urls[i] objectForKey:@"thumbnail_pic"];
                if (![thumbnailImageUrl hasSuffix:@".gif"]) {
                    thumbnailImageUrl = [thumbnailImageUrl stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
                }
                
                NSDictionary *imgdics = [NSDictionary dictionaryWithObjectsAndKeys:thumbnailImageUrl,@"thumbnail_pic", nil];
                [bmiddle_pic_urls addObject:imgdics];
            }
            self.model_detail.pic_urls = bmiddle_pic_urls;
            
            NSDictionary *imgDICS = self.model_detail.pic_urls[indexPath.item];
            NSString *imgUrl = [imgDICS objectForKey:@"thumbnail_pic"];
            NSURL *photoUrl = [NSURL URLWithString:imgUrl];
//            if ([imgUrl hasSuffix:@".gif"]) {
//
//                cell.gifLabel.hidden = NO;
//            }else{
//                cell.gifLabel.hidden = YES;
//            }
            
            [cellImage sd_setImageWithURL:photoUrl placeholderImage:[UIImage imageNamed:@"placeholderImg_gray"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                //                NSLog(@"图片下载进度 = %f", (float)receivedSize/(float)expectedSize );
            } completed:^(UIImage *image, NSData *data, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error) {
                    NSLog(@"ERROR: %@", error);
                } else {
                    
                }
            }];
            
        }
        return cell;
        
    }else if(self.model_detail.retWeibo.pic_urls.count > 0){
        //转发微博，带图片
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"re_detail_Img_Cell" forIndexPath:indexPath];
        UIImageView *cellImage = [[UIImageView alloc]initWithFrame:cell.bounds];
        cellImage.contentMode = UIViewContentModeScaleAspectFill;
        cellImage.clipsToBounds = YES;
        [cell.contentView addSubview:cellImage];
        
        if (indexPath.row < self.model_detail.retWeibo.pic_urls.count) {
            
            NSMutableArray *bmiddle_pic_urls = [NSMutableArray arrayWithCapacity:self.model_detail.retWeibo.pic_urls.count];
            for (NSInteger i = 0; i < self.model_detail.retWeibo.pic_urls.count; i++) {
                NSString *thumbnailImageUrl = [self.model_detail.retWeibo.pic_urls[i] objectForKey:@"thumbnail_pic"];
                if (![thumbnailImageUrl hasSuffix:@".gif"]) {
                    thumbnailImageUrl = [thumbnailImageUrl stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
                }
                
                NSDictionary *imgdics = [NSDictionary dictionaryWithObjectsAndKeys:thumbnailImageUrl,@"thumbnail_pic", nil];
                [bmiddle_pic_urls addObject:imgdics];
            }
            self.model_detail.retWeibo.pic_urls = bmiddle_pic_urls;
            
            NSDictionary *imgDICS = self.model_detail.retWeibo.pic_urls[indexPath.item];
            NSString *imgUrl = [imgDICS objectForKey:@"thumbnail_pic"];
            NSURL *photoUrl = [NSURL URLWithString:imgUrl];
            //            if ([imgUrl hasSuffix:@".gif"]) {
            //
            //                cell.gifLabel.hidden = NO;
            //            }else{
            //                cell.gifLabel.hidden = YES;
            //            }
            
            [cellImage sd_setImageWithURL:photoUrl placeholderImage:[UIImage imageNamed:@"placeholderImg_gray"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                //                NSLog(@"图片下载进度 = %f", (float)receivedSize/(float)expectedSize );
            } completed:^(UIImage *image, NSData *data, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error) {
                    NSLog(@"ERROR: %@", error);
                } else {
                    
                }
            }];
            
        }
        return cell;

    }else{
        return nil;
    }
    
}




-(void)setUpDetailWeibo:(WeiboModel *)model{
    
    self.model_detail = model;

    //头像
    NSString *imgURL = self.model_detail.user.avatar_large;
    NSURL *avatorUrl = [NSURL URLWithString:imgURL];
    if (avatorUrl != nil) {
        [self.detail_avatar sd_setImageWithURL:avatorUrl];
    }
    
    //昵称
    self.detail_name.text = self.model_detail.user.screen_name;
    
    
    //创建日期
    NSString *createDate =  self.model_detail.createDate;
    NSString *dateString = [Utils fomateString:createDate];
    
    
    if (createDate != nil ) {
        self.detail_date.text = dateString;
    }
    
    
    //微博来源
    NSString *ret = [Utils parseSource: self.model_detail.source];
    if (ret != nil) {
       self.detail_source.text = [NSString stringWithFormat:@"来自 %@",ret];
    }
    
    //微博正文
    self.detail_text.text = self.model_detail.text;
    CGSize size = [self.detail_text sizeThatFits:CGSizeMake([[UIScreen mainScreen]bounds].size.width - 40, MAXFLOAT)];
    self.detail_text.bounds = CGRectMake(0, 0, size.width, size.height);
    self.detail_text_height.constant = size.height;
    self.detail_text.lineBreakMode = NSLineBreakByWordWrapping;
    self.detail_text.numberOfLines = 0;
    

    //转发视图
    if (self.model_detail.retWeibo) {
        retWeiboDetailView = [[UIView alloc]initWithFrame:CGRectMake(20, 70 + size.height, SCREENWIDTH-40, 250)];
//        retWeiboDetailView.origin = CGPointMake(20, self.detail_text.bottom);
//        retWeiboDetailView.bounds = CGRectMake(0, 0, SCREENWIDTH-40, 250);//初始先给一个默认高度250
        retWeiboDetailView.backgroundColor = [UIColor grayColor];
        [self addSubview:retWeiboDetailView];
        
        MLEmojiLabel *retDetail_text = [[MLEmojiLabel alloc]initWithFrame:CGRectZero];
        retDetail_text.text = self.model_detail.retWeibo.text;
        CGSize retTextSize = [retDetail_text sizeThatFits:CGSizeMake([[UIScreen mainScreen]bounds].size.width - 60, MAXFLOAT)];
        retDetail_text.origin = CGPointMake(10, 5);
        retDetail_text.bounds = CGRectMake(0, 0, retTextSize.width, retTextSize.height);
        retDetail_text.lineBreakMode = NSLineBreakByWordWrapping;
        retDetail_text.numberOfLines = 0;
        
        [retWeiboDetailView addSubview:retDetail_text];
        
        UICollectionView *reWeibo_detail_imgs;
        if (self.model_detail.retWeibo.pic_urls.count>0) {
         
            UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
            flowLayout.itemSize  = CGSizeMake(120, 120);
            flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
            flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            flowLayout.minimumInteritemSpacing = 10;
            flowLayout.minimumLineSpacing = 10;
            
            reWeibo_detail_imgs = [[UICollectionView alloc]initWithFrame:CGRectMake(0,retDetail_text.bottom, SCREENWIDTH, 130)collectionViewLayout:flowLayout];
            reWeibo_detail_imgs.backgroundColor = [UIColor whiteColor];
            [reWeibo_detail_imgs registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"re_detail_Img_Cell"];
            reWeibo_detail_imgs.showsHorizontalScrollIndicator = NO;
            reWeibo_detail_imgs.delegate = self;
            reWeibo_detail_imgs.dataSource = self;
            
            [retWeiboDetailView addSubview:reWeibo_detail_imgs];
        }
        
        retWeiboDetailView.bounds = CGRectMake(0, 0, SCREENWIDTH-40, self.model_detail.retWeibo.pic_urls.count>0 ? 5+retDetail_text.height+130 : 5+retDetail_text.height);
    }
    
    //微博图片
    if (self.model_detail.pic_urls.count > 0) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize  = CGSizeMake(120, 120);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.minimumLineSpacing = 10;
        
        UICollectionView *detail_imgs = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 70 + size.height, SCREENWIDTH, 130)collectionViewLayout:flowLayout];
        detail_imgs.backgroundColor = [UIColor whiteColor];
        [detail_imgs registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"detail_Img_Cell"];
        detail_imgs.showsHorizontalScrollIndicator = NO;
        detail_imgs.delegate = self;
        detail_imgs.dataSource = self;
        
        [self addSubview:detail_imgs];
    }
    
    //设置详细微博的高度
    //正文、正文+图片、正文+转发正文、正文+转发图片
//    if (self.model_detail.pic_urls.count > 0) {
//        self.bounds = CGRectMake(0, 0, SCREENWIDTH, 20 + size.height + 10 + 30 + 20 + 20 + 130);
//    }else if (self.model_detail.retWeibo){
//        if (self.model_detail.retWeibo.pic_urls.count > 0) {
//            self.bounds = CGRectMake(0, 0, SCREENWIDTH, <#CGFloat height#>)
//        }
//    }
    self.bounds = CGRectMake(0, 0, SCREENWIDTH, self.model_detail.pic_urls.count > 0 ? 20 + size.height + 10 + 30 + 20 + 20 + 130 : 20 + size.height + 10 + 30 + 20 + 20 + retWeiboDetailView.height);

}


@end
