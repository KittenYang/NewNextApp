//
//  KYCell.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/15/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "KYCell.h"
#import "HomeTableViewController.h"
#import "UIView+Extra.h"
#import "Utils.h"

#define BarColor  [UIColor colorWithRed:249/255.0 green:56/255.0 blue:54/255.0 alpha:1]
@implementation KYCell{
    UIView *postView;
    UIView *comView;
    
}


- (void)awakeFromNib {
    
    //-----头像------
    
    self.avator.layer.cornerRadius = self.avator.width / 2;
    self.avator.layer.masksToBounds = YES;
    self.avator.layer.borderWidth = 1.0f;
    self.avator.layer.borderColor = [UIColor whiteColor].CGColor;

    [self createLine];
    [self addPanGesture];
    
    
    //MotionEffects
//    UIInterpolatingMotionEffect *horizontalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
//    horizontalMotionEffect.minimumRelativeValue = @(-25);
//    horizontalMotionEffect.maximumRelativeValue = @(25);
//    [self addMotionEffect:horizontalMotionEffect];
//    
//    
//    UIInterpolatingMotionEffect *shadowEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"layer.shadowOffset" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
//    shadowEffect.minimumRelativeValue = [NSValue valueWithCGSize:CGSizeMake(-10, 5)];
//    shadowEffect.maximumRelativeValue = [NSValue valueWithCGSize:CGSizeMake(10, 5)];
//    [self addMotionEffect:shadowEffect];

}

//-(void)drawRect:(CGRect)rect{
//
//        
//        //----------微博内容--------------
//        self.cellView.weiboView.weiboText.text = self.weiboModel.text;
//        //    [cell.cellView.weiboView updateView];
//        
//        
//        //-----------创建日期---------------
//        NSString *createDate =  self.weiboModel.createDate;
//        NSString *dateString = [Utils fomateString:createDate];
//        if (createDate != nil ) {
//            self.cellView.createDateLabel.text = dateString;
//        }else{
//            self.cellView.createDateLabel.hidden = YES;
//        }
//        
//        //----------微博来源---------------
//        NSString *ret = [Utils parseSource: self.weiboModel.source];
//        if (ret != nil) {
//            
//            self.cellView.sourceLabel.text = [NSString stringWithFormat:@"来自 %@",ret];
//            
//        }else{
//            self.cellView.sourceLabel.hidden = YES;
//        }
//        
//        
//        //---图片视图----
//        if (self.weiboModel.pic_urls.count > 0) {
//            
//            self.cellView.weiboView.collectionViewHeight.constant = 130.0f;
//            
//        }else {
//            self.cellView.weiboView.collectionViewHeight.constant = 0.0f;
//        }
//    
//        //------转发视图-------
//        if (self.weiboModel.retWeibo) {
//            
//            self.cellView.weiboView.reWeiboView.reWeiboModel = self.weiboModel.retWeibo;
//            self.cellView.weiboView.reWeiboView.reWeiboText.text = self.weiboModel.retWeibo.text;
//            CGRect oldFrame = self.cellView.weiboView.reWeiboView.reWeiboText.frame;
//            
//            self.cellView.weiboView.reWeiboView.reWeiboText.lineBreakMode = NSLineBreakByWordWrapping;
//            CGSize size = [self.cellView.weiboView.reWeiboView.reWeiboText sizeThatFits:CGSizeMake(self.cellView.weiboView.reWeiboView.reWeiboText.frame.size.width, MAXFLOAT)];
//            
//            self.cellView.weiboView.reWeiboView.reWeiboText.frame =CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, size.height);
//            
//            //
//            if (self.weiboModel.retWeibo.pic_urls.count > 0) {
//                
//                self.cellView.weiboView.reWeiboView.reCollectionViewHeight.constant = 130.0f;
//                
//            }else {
//                self.cellView.weiboView.reWeiboView.reCollectionViewHeight.constant = 0.0f;
//            }
//            
//            self.cellView.weiboView.reWeiboView.reWeiboHeight.constant = self.cellView.weiboView.reWeiboView.reWeiboText.bounds.size.height + self.cellView.weiboView.reWeiboView.reCollectionViewHeight.constant + 5 + 5 + 5;
//            //        cell.cellView.weiboView.reWeiboView.reWeiboHeight.constant = 190.0f;
//            
//        }else{
//            
//            self.cellView.weiboView.reWeiboView.reWeiboText.text = nil;
//            self.cellView.weiboView.reWeiboView.reCollectionViewHeight.constant = 0.0f;
//            self.cellView.weiboView.reWeiboView.reWeiboHeight.constant = 0;
//        }
//        
//        
//
//
//}


-(void)layoutSubviews{
    [super layoutSubviews];
//    self.cellView.weiboModel = self.weiboModel;
//    [self.cellView layoutIfNeeded];
    
//    NSString *imgURL = self.weiboModel.user.avatar_large;
//    
//    //多线程实现头像的加载
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSURL *avatorUrl = [NSURL URLWithString:imgURL];
//        if (avatorUrl != nil) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.avator sd_setImageWithURL:avatorUrl];
//            });
//        }
//    });
    


//    CALayer* avatorShadowLayer = [CALayer layer];
//    avatorShadowLayer.shadowColor = [UIColor blackColor].CGColor;
//    avatorShadowLayer.shadowRadius = 0.5f;
//    avatorShadowLayer.shadowOffset = CGSizeMake(0.f, 0.5f);
//    avatorShadowLayer.shadowOpacity = 0.6f;
//
//    [avatorShadowLayer addSublayer:self.avator.layer];
//    [self.layer insertSublayer:avatorShadowLayer below:self.verticalLine];

    
    
//    //-----头像-------
//    NSString *imgURL = self.weiboModel.user.avatar_large;
//    
//    //多线程实现头像的加载
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSURL *avatorUrl = [NSURL URLWithString:imgURL];
//        if (avatorUrl != nil) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.avator sd_setImageWithURL:avatorUrl];
//            });
//        }
//    });
//    
//    //-----昵称-------
//    self.name.text = self.weiboModel.user.screen_name;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

#pragma mark  -  gesture delegate
//让cell允许两个手势，一个是tableview的上下滑动，一个是cell的左右滑动
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

//区分两个手势敏感度关键
- (BOOL)gestureRecognizerShouldBegin:(UIScreenEdgePanGestureRecognizer *)gestureRecognizer
{
    if (! [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        return YES;
    }
    
    UIView *gestureView = [gestureRecognizer view];
    CGPoint translation = [gestureRecognizer translationInView:[gestureView superview]];
    
    //只有水平方向的距离绝对值 大于 垂直方向的距离绝对值 才能触发
    if (fabsf(translation.x) > fabsf(translation.y) || (fabsf(translation.x) == 0 && fabsf(translation.y) == 0))
    {
        return YES;
    }
    
    return NO;
}


- (void) createLine {
    self.verticalLine = [CAShapeLayer layer];
    self.verticalLine.fillColor = BarColor.CGColor;
    [self.layer addSublayer:self.verticalLine];
}



//左边曲线
- (CGPathRef) getLeftLinePathWithAmount:(CGFloat)amount {
    UIBezierPath *verticalLine = [UIBezierPath bezierPath];
    CGPoint topPoint = CGPointMake(0, 0);
    CGPoint midControlPoint = CGPointMake(amount, self.bounds.size.height/2);
    CGPoint bottomPoint = CGPointMake(0, self.bounds.size.height);

    [verticalLine moveToPoint:topPoint];
    [verticalLine addQuadCurveToPoint:bottomPoint controlPoint:midControlPoint];
    [verticalLine closePath];

    return [verticalLine CGPath];
}

//右边曲线
-(CGPathRef) getRightLinePathWithAmount:(CGFloat)amount{
    UIBezierPath *verticalLine = [UIBezierPath bezierPath];
    CGPoint topPoint = CGPointMake(self.bounds.size.width , 0);
    CGPoint midControlPoint = CGPointMake(self.bounds.size.width - amount, self.bounds.size.height/2);
    CGPoint bottomPoint = CGPointMake(self.bounds.size.width , self.bounds.size.height);

    
    [verticalLine moveToPoint:topPoint];
    [verticalLine addQuadCurveToPoint:bottomPoint controlPoint:midControlPoint];
    [verticalLine closePath];
    
    return [verticalLine CGPath];
}

- (void) addPanGesture {
    self.sgr_left = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSlide:)];
    self.sgr_left.edges =  UIRectEdgeLeft;
    self.sgr_left.delegate = self;
    self.sgr_left.delaysTouchesBegan = YES;
    [self addGestureRecognizer:self.sgr_left];
    
    
    self.sgr_right = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSlide:)];
    self.sgr_right.edges =  UIRectEdgeRight;
    self.sgr_right.delegate = self;
    self.sgr_right.delaysTouchesBegan = YES;
    [self addGestureRecognizer:self.sgr_right];
    
}



- (void) handleSlide:(UIScreenEdgePanGestureRecognizer *)gr{
    CGFloat amountX = [gr translationInView:self].x;
//    CGFloat amountY = [gr translationInView:self].y;


    if (gr.state == UIGestureRecognizerStateBegan) {
        id view = [self superview];
        
        while (view && [view isKindOfClass:[UITableView class]] == NO) {
            view = [view superview];
        }
        
        
        UITableView *tableView = (UITableView *)view;
        tableView.scrollEnabled = NO;

    }
    
    if (gr.state == UIGestureRecognizerStateChanged){
        if (amountX >= 0) {
            if (postView == nil) {
                postView = [[UIView alloc]init];
                postView.center = CGPointMake(-100, self.bounds.size.height / 2);
                postView.bounds = CGRectMake(0, 0, 100, 100);
                postView.backgroundColor = BarColor;
                postView.layer.cornerRadius = 50;
                [self addSubview:postView];

            }

            //向右滑 ———— 转发
            [self cancelComment];
            self.verticalLine.path = [self getLeftLinePathWithAmount:amountX];
            
            postView.frame = CGRectMake(-100 + amountX*0.4, postView.frame.origin.y, 100, 100);
            if (amountX > self.bounds.size.width / 2) {
                
                id view = [self superview];
                
                while (view && [view isKindOfClass:[UITableView class]] == NO) {
                    view = [view superview];
                }
                
                UITableView *tableView = (UITableView *)view;
                tableView.scrollEnabled = YES;

                
                [UIView animateWithDuration:0.5f delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    postView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
                } completion:^(BOOL finished) {
                    [self cancelPost];
                }];
                [self removeGestureRecognizer:gr];
                [self animateLeftLineReturnFrom:amountX];
            }
        }else{
            
            if (comView == nil) {
    
                comView = [[UIView alloc]init];
                comView.center = CGPointMake(self.bounds.size.width + 100, self.bounds.size.height / 2);
                comView.bounds = CGRectMake(0, 0, 100, 100);
                comView.backgroundColor = BarColor;
                comView.layer.cornerRadius = 50;
                [self addSubview:comView];
            }

            
            //向左滑 ———— 评论
            [self cancelPost];
            self.verticalLine.path = [self getRightLinePathWithAmount:abs(amountX)];
            
            comView.frame = CGRectMake(self.bounds.size.width  + amountX*0.4, comView.frame.origin.y, 100, 100);
            if (abs(amountX) > self.bounds.size.width / 2) {
                
                id view = [self superview];
                
                while (view && [view isKindOfClass:[UITableView class]] == NO) {
                    view = [view superview];
                }
                
                UITableView *tableView = (UITableView *)view;
                tableView.scrollEnabled = YES;

                [UIView animateWithDuration:0.5f delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    comView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
                } completion:^(BOOL finished) {
                    [self cancelComment];
                }];

                [self removeGestureRecognizer:gr];

                [self animateRightLineReturnFrom:abs(amountX)];
            }
        }
    }

    if (gr.state == UIGestureRecognizerStateEnded || gr.state == UIGestureRecognizerStateCancelled || gr.state == UIGestureRecognizerStateFailed) {
        
        id view = [self superview];
        
        while (view && [view isKindOfClass:[UITableView class]] == NO) {
            view = [view superview];
        }
        
        UITableView *tableView = (UITableView *)view;
        tableView.scrollEnabled = YES;
        
        [self cancelPost];
        [self cancelComment];
        if (amountX >= 0) {
            [self removeGestureRecognizer:gr];
            [self animateLeftLineReturnFrom:amountX];
        }else{
            [self removeGestureRecognizer:gr];
            [self animateRightLineReturnFrom:abs(amountX)];
        }
    
    }
    
}

-(void)cancelPost{
    
    [UIView animateWithDuration:0.8f delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        postView.center = CGPointMake(-100, self.bounds.size.height / 2);
    } completion:^(BOOL finished) {
        [postView removeFromSuperview];
        postView = nil;
    }];
}

-(void)cancelComment{
    
    [UIView animateWithDuration:0.8f delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        comView.center = CGPointMake(self.bounds.size.width + 100, self.bounds.size.height / 2);
    } completion:^(BOOL finished) {
        [comView removeFromSuperview];
        comView = nil;
    }];
}

- (void) animateLeftLineReturnFrom:(CGFloat)positionX {
    
    // ----- ANIMATION WITH BOUNCE
    CAKeyframeAnimation *morph = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    morph.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    NSArray *values = @[(id) [self getLeftLinePathWithAmount:positionX],(id) [self getLeftLinePathWithAmount:-(positionX * 0.9)],(id) [self getLeftLinePathWithAmount:(positionX * 0.6)],(id) [self getLeftLinePathWithAmount:-(positionX * 0.4)],(id) [self getLeftLinePathWithAmount:(positionX * 0.25)],(id) [self getLeftLinePathWithAmount:-(positionX * 0.15)],(id) [self getLeftLinePathWithAmount:(positionX * 0.05)],(id) [self getLeftLinePathWithAmount:0.0]];
    morph.values = values;
    morph.duration = 0.5;
    morph.removedOnCompletion = NO;
    morph.fillMode = kCAFillModeForwards;
    morph.delegate = self;
    [self.verticalLine addAnimation:morph forKey:@"bounce_left"];

}

- (void) animateRightLineReturnFrom:(CGFloat)positionX {

    
    // ----- ANIMATION WITH BOUNCE
    CAKeyframeAnimation *morph = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    morph.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    NSArray *values = @[(id) [self getRightLinePathWithAmount:positionX],(id) [self getRightLinePathWithAmount:-(positionX * 0.9)],(id) [self getRightLinePathWithAmount:(positionX * 0.6)],(id) [self getRightLinePathWithAmount:-(positionX * 0.4)],(id) [self getRightLinePathWithAmount:(positionX * 0.25)],(id) [self getRightLinePathWithAmount:-(positionX * 0.15)],(id) [self getRightLinePathWithAmount:(positionX * 0.05)],(id) [self getRightLinePathWithAmount:0.0]];
    morph.values = values;
    morph.duration = 0.5;
    morph.removedOnCompletion = NO;
    morph.fillMode = kCAFillModeForwards;
    morph.delegate = self;
    [self.verticalLine addAnimation:morph forKey:@"bounce_right"];
}



#pragma mark  - CAAnimationDelegate
- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (anim == [self.verticalLine animationForKey:@"bounce_left"] ) {
        self.verticalLine.path = [self getLeftLinePathWithAmount:0.0];
        [self.verticalLine removeAllAnimations];
        [self addPanGesture];
    }else if(anim == [self.verticalLine animationForKey:@"bounce_right"]){
        self.verticalLine.path = [self getRightLinePathWithAmount:0.0];
        [self.verticalLine removeAllAnimations];
        [self addPanGesture];

    }
}



@end
