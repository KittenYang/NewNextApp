//
//  JellyView.m
//  KYJellyPullToRefresh
//
//  Created by Kitten Yang on 2/7/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//



#import "JellyView.h"

@interface JellyView()



@end

@implementation JellyView{
    CGRect jellyFrame;
    UIColor *fillColor;
//    CAShapeLayer *shapeLayer;
    
    UIDynamicAnimator *animator;
    UICollisionBehavior *coll;
    UISnapBehavior  *snap;
    
//    BOOL isFirstTime;
    CGFloat angle;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (id)initWithFrame:(CGRect)frame{
    self.userFrame = frame;
    jellyFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height + [UIScreen mainScreen].bounds.size.height);

    self = [super initWithFrame:jellyFrame];
    if (self) {
        self.isLoading = NO;
        self.isFirstTime = NO;
        
        self.frame = jellyFrame;
        
        //贝塞尔曲线的控制点
        self.controlPoint = [[UIView alloc]initWithFrame:CGRectMake(self.userFrame.size.width / 2 - 5, self.userFrame.size.height - 5, 10, 10)];
        self.controlPoint.backgroundColor = [UIColor clearColor];
        [self addSubview:self.controlPoint];
        
        //小球视图
        _ballView = [[UIImageView alloc]initWithFrame:CGRectMake(self.userFrame.size.width / 3 - 20, self.userFrame.size.height - 100, 40, 40)];
        _ballView.layer.cornerRadius = _ballView.bounds.size.width / 2;
        _ballView.image = [UIImage imageNamed:@"sun"];
        _ballView.backgroundColor = [UIColor clearColor];
        [self addSubview:_ballView];
        
        //UIDynamic
        animator = [[UIDynamicAnimator alloc]initWithReferenceView:self];
        UIGravityBehavior *grv = [[UIGravityBehavior alloc]initWithItems:@[_ballView]];
        grv.magnitude = 2;
        [animator addBehavior:grv];
        coll =  [[UICollisionBehavior alloc]initWithItems:@[_ballView]];
        
        UIDynamicItemBehavior *item = [[UIDynamicItemBehavior alloc]initWithItems:@[_ballView]];
        item.elasticity = 0;
        item.density = 1;
        
        self.shapeLayer = [CAShapeLayer layer];
        [self.layer insertSublayer:self.shapeLayer below:_ballView.layer];
    
    }
    return self;
}


- (void)drawRectInJellyView {
    
    if (self.isLoading == NO) {
        [coll removeBoundaryWithIdentifier:@"弧形"];
        fillColor = [UIColor redColor];
    }else{

        if (!self.isFirstTime) {
            self.isFirstTime = YES;
            snap = [[ UISnapBehavior alloc]initWithItem:_ballView snapToPoint:CGPointMake(self.userFrame.size.width / 2, self.userFrame.size.height - (90+64.5)/2)];
            [animator addBehavior:snap];
            
//            [self startLoading];
        }

        fillColor = [UIColor redColor];
        
    }
    
    self.controlPoint.center = (self.isLoading == NO)?(CGPointMake(self.userFrame.size.width / 2 , self.userFrame.size.height + self.controlPointOffset)) : (CGPointMake(self.userFrame.size.width / 2, self.userFrame.size.height + self.controlPointOffset));
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0,self.userFrame.size.height)];
    [path addQuadCurveToPoint:CGPointMake(self.userFrame.size.width,self.userFrame.size.height) controlPoint:self.controlPoint.center];
    [path addLineToPoint:CGPointMake(self.userFrame.size.width, 0)];
    [path addLineToPoint:CGPointMake(0, 0)];
    [path closePath];
    
    
    self.shapeLayer.path = path.CGPath;
    self.shapeLayer.fillColor = [UIColor redColor].CGColor;

    
    if (self.isLoading == NO) {
        [coll addBoundaryWithIdentifier:@"弧形" forPath:path];
        [animator addBehavior:coll];
    }
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextAddPath(context, path.CGPath);
//    [fillColor setFill];
//    CGContextFillPath(context);
    
}

- (void)startLoading
{
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.01 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _ballView.transform = endAngle;
    } completion:^(BOOL finished) {
        angle += 10;
        [self startLoading];
    }];
    
}

-(void)removeAnimator{
    [animator removeAllBehaviors];
    animator = nil;
    CGPathRelease(self.shapeLayer.path);
}



@end
