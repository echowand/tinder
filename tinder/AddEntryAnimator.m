//
//  AddEntryAnimator.m
//  tinder
//
//  Created by Guanqun Mao on 9/18/15.
//  Copyright © 2015 Guanqun Mao. All rights reserved.
//

#import "AddEntryAnimator.h"

@implementation AddEntryAnimator


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.4f;
}

-(void)animateTransition:
(id<UIViewControllerContextTransitioning>)transitionContext
{
    id fromViewController =
    [transitionContext viewControllerForKey:
     UITransitionContextFromViewControllerKey];
    
    id toViewController =
    [transitionContext viewControllerForKey:
     UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    if (self.presenting)
    {
        [containerView addSubview: [toViewController view] ];
        [toViewController view].alpha = 0;
        [UIView animateWithDuration:0.4
                         animations:^{
                         }
                         completion:^(BOOL finished){
                             // code to run when animation completes
                             // (in this case, another animation:)
                             [UIView animateWithDuration:0.4
                                              animations:^{
                                                  [toViewController view].alpha = 1.0;   // fade out
                                              }
                                              completion:^(BOOL finished){  
                                                  [transitionContext completeTransition:YES];
                                              }];
                         }];
    }
    else
    {
        [UIView animateWithDuration:0.4
                         animations:^{
                         }
                         completion:^(BOOL finished){
                             // code to run when animation completes
                             // (in this case, another animation:)
                             [UIView animateWithDuration:0.4
                                              animations:^{
                                                  [fromViewController view].alpha = 0.0;   // fade out
                                              }
                                              completion:^(BOOL finished){
                                                  [[fromViewController view] removeFromSuperview];
                                              }];
                         }];
    }
}
@end
