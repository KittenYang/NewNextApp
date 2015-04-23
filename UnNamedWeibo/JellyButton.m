//
//  JellyButton.m
//  VBFJellyView
//
//  Created by Victor Baro on 03/07/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

#import "JellyButton.h"

@implementation JellyButton


-(void)show {

    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.layer.shadowOpacity = 0.6;
    self.layer.shadowRadius = 0.5f;
    self.layer.masksToBounds = NO;

    [super show];
    [self buttonTapped];
}

- (void) buttonTapped {
    for (UIView *view in self.subviews) {
        if (view.tag % 2 != 0) {
            //Apply push behav on control points
            UIPushBehavior *pushB = [[UIPushBehavior alloc]initWithItems:@[view] mode:UIPushBehaviorModeInstantaneous];
            UIView *centerView = self.subviews[4];
            
            pushB.pushDirection = CGVectorMake(view.center.x - centerView.center.x,
                                               view.center.y - centerView.center.y);
            if (!self.pushMagnitude) {
                self.pushMagnitude = 0.1;
            }
            pushB.magnitude = self.pushMagnitude;
            [self.mainAnimator addBehavior:pushB];
        } else {
            //Add massive ressistance so the button won't move around
            UIDynamicItemBehavior *bh = [[UIDynamicItemBehavior alloc]initWithItems:@[view]];
            bh.density = 1000;
            [self.mainAnimator addBehavior:bh];
        }
        
    }
    
    
}



@end
