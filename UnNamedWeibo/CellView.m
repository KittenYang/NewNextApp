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
    self.layer.cornerRadius = 5;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
//------------使用卷纸的阴影---------------
//    CGSize size = self.bounds.size;
//    CGFloat curlFactor = 15.0f;
//    CGFloat shadowDepth = 5.0f;
//    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(0.0f, 0.0f)];
//    [path addLineToPoint:CGPointMake(size.width, 0.0f)];
//    [path addLineToPoint:CGPointMake(size.width, size.height + shadowDepth)];
//    [path addCurveToPoint:CGPointMake(0.0f, size.height + shadowDepth)
//            controlPoint1:CGPointMake(size.width - curlFactor, size.height + shadowDepth - curlFactor)
//            controlPoint2:CGPointMake(curlFactor, size.height + shadowDepth - curlFactor)];
//    
//    self.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.layer.shadowOpacity = 0.7f;
//    self.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);
//    self.layer.shadowRadius = 2.0f;
//    self.layer.shadowPath = path.CGPath;
//    self.layer.masksToBounds = NO;

//-----------使用普通阴影-----------------
//    self.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.layer.shadowOffset = CGSizeMake(0, 0.5);
//    self.layer.shadowOpacity = 0.2;
//    self.layer.shadowRadius = 2.0f;
//    self.layer.masksToBounds = NO;
    



    

//    self.weiboView.weiboModel = self.weiboModel;
    //----------微博来源--------------
//    NSString *ret = [Utils parseSource: self.weiboModel.source];
//    if (ret != nil) {
//        
//        self.sourceLabel.text = [NSString stringWithFormat:@"来自 %@",ret];
//        
//    }else{
//        self.sourceLabel.hidden = YES;
//    }
    
    
    //----------发布时间--------------
//    NSString *createDate =  self.weiboModel.createDate;
//    NSString *dateString = [Utils fomateString:createDate];
//    if (createDate != nil ) {
//        self.createDateLabel.text = dateString;
//    }else{
//        self.createDateLabel.hidden = YES;
//    }
    
}
@end
