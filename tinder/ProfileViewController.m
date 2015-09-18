//
//  ProfileViewController.m
//  tinder
//
//  Created by Guanqun Mao on 9/18/15.
//  Copyright © 2015 Guanqun Mao. All rights reserved.
//

#import "ProfileViewController.h"
#import "ViewController.h"

@interface ProfileViewController ()<UIViewControllerTransitioningDelegate>
@property BOOL isPresenting;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ViewController *viewController = [segue destinationViewController];
    viewController.modalPresentationStyle = UIModalPresentationCustom;
    viewController.transitioningDelegate = self;
    
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    AddEntryAnimator *animator = [[AddEntryAnimator alloc] init];
    animator.presenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    AddEntryAnimator *animator = [[AddEntryAnimator alloc] init];
    animator.presenting = NO;
    return animator;
}


@end
