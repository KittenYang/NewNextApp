//
//  WBImageContentView.m
//  Weibo
//
//  Created by SKY on 15/5/26.
//  Copyright (c) 2015年 Sky. All rights reserved.
//

#import "WBContentImageView.h"


#define SIZE_IMAGE 80


@interface WBContentImageView()
{
    UIImageView *_imageOne;
    UIImageView *_imageTwo;
    UIImageView *_imageThree;
    UIImageView *_imageFour;
    UIImageView *_imageFive;
    UIImageView *_imageSix;
    UIImageView *_imageSeven;
    UIImageView *_imageEight;
    UIImageView *_imageNine;
}
@end


@implementation WBContentImageView

-(instancetype)init
{
    self=[super init];
    if (self)
    {
        self.backgroundColor=[UIColor whiteColor];
        [self configurationContentView];
        [self configurationLocation];
    }
    return self;
}


#pragma 配置view
-(void)configurationContentView
{
    _imageOne=[self setImage];
    _imageOne.tag=1;
    [self addSubview:_imageOne];
    
    
    _imageTwo=[self setImage];
    _imageTwo.tag=2;
    [self addSubview:_imageTwo];
    
    
    _imageThree=[self setImage];
    _imageThree.tag=3;
    [self addSubview:_imageThree];
    
    
    _imageFour=[self setImage];
    _imageFour.tag=4;
    [self addSubview:_imageFour];
    
    
    _imageFive=[self setImage];
    _imageFive.tag=5;
    [self addSubview:_imageFive];
    
    
    _imageSix=[self setImage];
    _imageSix.tag=6;
    [self addSubview:_imageSix];
    
    
    _imageSeven=[self setImage];
    _imageSeven.tag=7;
    [self addSubview:_imageSeven];
    
    _imageEight=[self setImage];
    _imageEight.tag=8;
    [self addSubview:_imageEight];
    
    
    _imageNine=[self setImage];
    _imageNine.tag=9;
    [self addSubview:_imageNine];
}


#pragma mark － 配置位置
-(void)configurationLocation
{
    _imageOne.frame=CGRectMake(CELL_SIDEMARGIN,CELL_PADDING_6,SIZE_IMAGE,SIZE_IMAGE);
    _imageTwo.frame=CGRectMake(CELL_PADDING_6+_imageOne.right,CELL_PADDING_6,SIZE_IMAGE,SIZE_IMAGE);
    _imageThree.frame=CGRectMake(CELL_PADDING_6+_imageTwo.right,CELL_PADDING_6,SIZE_IMAGE,SIZE_IMAGE);
    
    
    
    
    _imageFour.frame=CGRectMake(CELL_SIDEMARGIN,CELL_PADDING_6+_imageOne.bottom,SIZE_IMAGE,SIZE_IMAGE);
    _imageFive.frame=CGRectMake(CELL_PADDING_6+_imageFour.right,CELL_PADDING_6+_imageOne.bottom,SIZE_IMAGE,SIZE_IMAGE);
    _imageSix.frame=CGRectMake(CELL_PADDING_6+_imageFive.right,CELL_PADDING_6+_imageOne.bottom,SIZE_IMAGE,SIZE_IMAGE);
    
    
    _imageSeven.frame=CGRectMake(CELL_SIDEMARGIN,CELL_PADDING_6+_imageFour.bottom,SIZE_IMAGE,SIZE_IMAGE);
    _imageEight.frame=CGRectMake(CELL_PADDING_6+_imageSeven.right,CELL_PADDING_6+_imageFour.bottom,SIZE_IMAGE,SIZE_IMAGE);
    _imageNine.frame=CGRectMake(CELL_PADDING_6+_imageEight.right,CELL_PADDING_6+_imageFour.bottom,SIZE_IMAGE,SIZE_IMAGE);
}


#pragma 初始化
-(UIImageView *)setImage
{
    UIImageView *image=[[UIImageView alloc]init];
    image.contentMode=UIViewContentModeScaleAspectFill;
    image.backgroundColor = [UIColor lightGrayColor];
    image.clipsToBounds=YES;
    return image;
}

#pragma 赋值
-(void)setUrlArray:(NSMutableArray *)urlArray
{
    _urlArray=urlArray;
    for (NSInteger i=0;i<9;++i)
    {
        UIImageView *image=(UIImageView *)[self viewWithTag:i+1];
        
        if (i<self.urlArray.count)
        {
            image.hidden = NO;
            [image sd_setImageWithURL:[NSURL URLWithString:[self.urlArray objectAtIndex:i]] placeholderImage:nil options:SDWebImageLowPriority];
        } else
        {
            image.hidden = YES;
        }
    }
}


////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
+(float)getContentImageViewHeight:(NSInteger)count
{
    if (count>=1&&count<=3)
    {
        return CELL_PADDING_6*2+SIZE_IMAGE;
    }
    else if (count>=4&&count<=6)
    {
        return CELL_PADDING_6*3+SIZE_IMAGE*2;
    }
    else if(count>=7&&count<=9)
    {
        return CELL_PADDING_6*4+SIZE_IMAGE*3;
    }
    else
    {
        return 0;
    }
}
@end
