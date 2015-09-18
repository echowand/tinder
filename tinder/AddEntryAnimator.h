//
//  AddEntryAnimator.h
//  tinder
//
//  Created by Guanqun Mao on 9/18/15.
//  Copyright © 2015 Guanqun Mao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProfileViewController.h"

@interface AddEntryAnimator : NSObject <UIViewControllerAnimatedTransitioning>
@property (assign, nonatomic, getter = isPresenting) BOOL presenting;
@end
