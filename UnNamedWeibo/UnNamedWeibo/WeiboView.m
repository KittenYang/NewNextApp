//
//  WeiboView.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/17/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "WeiboView.h"

@implementation WeiboView

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
//    self.weiboText.text = self.weiboModel.text;
}


+(CGFloat)getWeiboHeight:(WeiboModel *)model{
    float height = 0;
    
    //-------------计算微博内容的高度-------------
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectZero];

    
    textLabel.text = model.text;
    height += textLabel.bounds.size.height;
    return height;
}
@end
