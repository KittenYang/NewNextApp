//
//  TableViewCell.m
//  Weibo
//
//  Created by SKY on 15/5/26.
//  Copyright (c) 2015年 Sky. All rights reserved.
//

#import "WBTableViewCell.h"
#import "WBHeadView.h"
#import "TYAttributedLabel.h"
#import "WBContentImageView.h"
#import "WBBottomView.h"
#import "VVeboLabel.h"


#define CELL_HEADVIEW_HEIGHT 54.0    //头部高度
#define CELL_BOTTOM_HEIGHT   50.0    //底部固定高度

@interface WBTableViewCell()
{
    WBHeadView *_headView;//头部view
    VVeboLabel *_contentAttributedLabel;//自身内容
    
    UIView *_retweetedView;//被转发的view
    VVeboLabel *_retweetedAttributedLabel;//被转发的内容view
    
    
    WBContentImageView *_contentImageView;//图片view
    
    
    WBBottomView *_bottomView;//底部view
    
    
    BOOL drawed;
}
@end


@implementation WBTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
        [self configurationContentView];
        [self configurationLocation];
    }
    return self;
}
-(void)setContainerViewController:(UIViewController *)containerViewController{
    if (_containerViewController != containerViewController) {
        _containerViewController = containerViewController;
        _contentImageView.containerViewController = _containerViewController;
    }
}

#pragma 配置view
-(void)configurationContentView
{
    _headView=[[WBHeadView alloc]init];
    _headView.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:_headView];
    
    
    _contentAttributedLabel=[[VVeboLabel alloc]init];
    _contentAttributedLabel.lineSpace=TITLE_LINESPACE;
    _contentAttributedLabel.font = TITLE_FONT_SIZE;
    _contentAttributedLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
    _contentAttributedLabel.backgroundColor = self.backgroundColor;
    [self.contentView addSubview:_contentAttributedLabel];
    
    
    _retweetedView=[[UIView alloc]init];
    _retweetedView.backgroundColor=RGBCOLOR(248,248,248);
    [self.contentView addSubview:_retweetedView];
    
    
    _retweetedAttributedLabel=[[VVeboLabel alloc]init];
    _retweetedAttributedLabel.lineSpace=TITLE_LINESPACE;
    _retweetedAttributedLabel.font = SUBTITLE_FONT_SIZE;
    _retweetedAttributedLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];;
    _retweetedAttributedLabel.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    [self.contentView addSubview:_retweetedAttributedLabel];
    
    
    
    _contentImageView=[[WBContentImageView alloc]initWithStyle:WBContentImageScrollStyle];
    [self.contentView addSubview:_contentImageView];
    
    
    _bottomView=[[WBBottomView alloc]init];
    [self.contentView addSubview:_bottomView];
}


#pragma mark － 配置位置
-(void)configurationLocation
{
    _headView.frame=CGRectMake(0,0,Getwidth,CELL_HEADVIEW_HEIGHT);
//    _contentAttributedLabel.frame=CGRectMake(CELL_SIDEMARGIN,CELL_HEADVIEW_HEIGHT+CELL_PADDING_6,Getwidth-CELL_SIDEMARGIN*2,0);
    _contentImageView.frame=CGRectMake(0,0,Getwidth,0);
//    _retweetedAttributedLabel.frame=CGRectMake(CELL_SIDEMARGIN,0,Getwidth-CELL_SIDEMARGIN*2,0);
}


//渲染
-(void)setHomeCellViewModel:(WBHomeCellViewModel *)homeCellViewModel
{
    
    _homeCellViewModel=homeCellViewModel;
    drawed = YES;
    _headView.homeCellViewModel=homeCellViewModel;
    _contentAttributedLabel.frame = CGRectMake(CELL_SIDEMARGIN,CELL_HEADVIEW_HEIGHT+CELL_PADDING_6,Getwidth-CELL_SIDEMARGIN*2,homeCellViewModel.contentHeight);
    [_contentAttributedLabel  setText:homeCellViewModel.statusModel.text];

//转发内容
    if (homeCellViewModel.statusModel.retweeted_status!=nil)
    {
        _retweetedAttributedLabel.hidden=NO;
        _retweetedView.hidden=NO;
        
        
        WBHomeCellViewModel *retweetedViewModel=(WBHomeCellViewModel *)homeCellViewModel.statusModel.retweeted_status;
        _retweetedAttributedLabel.frame=CGRectMake(CELL_SIDEMARGIN,CELL_PADDING_6*2+_contentAttributedLabel.bottom,Getwidth-CELL_SIDEMARGIN*2,retweetedViewModel.contentHeight);
        [_retweetedAttributedLabel setText:retweetedViewModel.statusModel.text];
        
        //判断是否有图片
        if (retweetedViewModel.contengImageHeight>0)
        {
            _contentImageView.hidden=NO;
        }
        else
        {
            _contentImageView.hidden=YES;
        }
        _contentImageView.backgroundColor=RGBCOLOR(248,248,248);
        _contentImageView.frame=CGRectMake(0,_retweetedAttributedLabel.bottom, Getwidth,retweetedViewModel.contengImageHeight);
        _contentImageView.urlArray=retweetedViewModel.statusModel.pic_urls;
        
        
        if (retweetedViewModel.contengImageHeight>0)
        {
            _retweetedView.frame=CGRectMake(0,CELL_PADDING_6+_contentAttributedLabel.bottom,Getwidth,retweetedViewModel.contentHeight+retweetedViewModel.contengImageHeight+CELL_PADDING_6);
        }
        else
        {
            _retweetedView.frame=CGRectMake(0,CELL_PADDING_6+_contentAttributedLabel.bottom,Getwidth,retweetedViewModel.contentHeight+retweetedViewModel.contengImageHeight+CELL_PADDING_6*2);
        }
        
        _bottomView.frame=CGRectMake(0,_retweetedView.bottom,Getwidth, CELL_BOTTOM_HEIGHT);
    }
    
//源内容
    else
    {
        _retweetedAttributedLabel.hidden=YES;
        _retweetedView.hidden=YES;
        
        
        //判断是否有图片
        if (homeCellViewModel.contengImageHeight>0)
        {
            _contentImageView.hidden=NO;
        }
        else
        {
            _contentImageView.hidden=YES;
        }
        _contentImageView.backgroundColor=[UIColor whiteColor];
        _contentImageView.frame=CGRectMake(0,_contentAttributedLabel.bottom, Getwidth,homeCellViewModel.contengImageHeight);
        _contentImageView.urlArray=homeCellViewModel.statusModel.pic_urls;
        
        _retweetedView.frame=CGRectMake(0,CELL_PADDING_6+_contentAttributedLabel.bottom,Getwidth,0);
        
        
        if (homeCellViewModel.contengImageHeight>0)
        {
            _bottomView.frame=CGRectMake(0,_contentImageView.bottom,Getwidth, CELL_BOTTOM_HEIGHT);
        }
        else
        {
            _bottomView.frame=CGRectMake(0,_contentImageView.bottom+CELL_PADDING_6,Getwidth, CELL_BOTTOM_HEIGHT);
        }
    }
    
    _bottomView.homeCellViewModel=homeCellViewModel;
}

- (void)clear{
    if (!drawed) {
        return;
    }
    
    [_contentAttributedLabel clear];
    if (!_retweetedAttributedLabel.hidden) {
        _retweetedAttributedLabel.hidden = YES;
        [_retweetedAttributedLabel clear];
    }

    drawed = NO;
}



////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
+(float)getHeight:(WBHomeCellViewModel *)homeCellViewModel
{
    float height=0;
    
    //头部固定高度
    height=CELL_HEADVIEW_HEIGHT;
    
    //头部跟内容的间隙
    height+=CELL_PADDING_6;
    
    
    //内容区域
    height+=homeCellViewModel.contentHeight;
    
    
    //被转发的内容
    if (homeCellViewModel.statusModel.retweeted_status!=nil)
    {
        WBHomeCellViewModel *retweetedViewModel=homeCellViewModel.statusModel.retweeted_status;
        
        height+=retweetedViewModel.contentHeight+CELL_PADDING_6*2;
        
        
        //被转发的有图片
        height+=retweetedViewModel.contengImageHeight;
    }
    else
    {
        //原文图片
        height+=homeCellViewModel.contengImageHeight;
        
        
        if (homeCellViewModel.contengImageHeight<=0)
        {
            //中间跟底部的间距
            height+=CELL_PADDING_6;
        }
    }
    
    
    //底部
    height+=CELL_BOTTOM_HEIGHT;
    
    return height;
}


-(void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
