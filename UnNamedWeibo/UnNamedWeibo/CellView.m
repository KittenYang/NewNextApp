//
//  CellView.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/17/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "CellView.h"
#import "Utils.h"

@implementation CellView

-(void)awakeFromNib{
    self.layer.cornerRadius = 10;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.weiboView.weiboModel = self.weiboModel;
    
    //----------微博来源--------------
    NSString *ret = [Utils parseSource: self.weiboModel.source];
    if (ret != nil) {
        
        self.sourceLabel.text = [NSString stringWithFormat:@"来自 %@",ret];
        
    }else{
        self.sourceLabel.hidden = YES;
    }
    
    
    //----------发布时间--------------
    NSString *createDate =  self.weiboModel.createDate;
    NSString *dateString = [Utils fomateString:createDate];
    if (createDate != nil ) {
        self.createDateLabel.text = dateString;
    }else{
        self.createDateLabel.hidden = YES;
    }

    
//    [self.weiboView setNeedsLayout];
}
@end
