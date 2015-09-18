//
//  ViewController.m
//  tinder
//
//  Created by Guanqun Mao on 9/18/15.
//  Copyright © 2015 Guanqun Mao. All rights reserved.
//

#import "ViewController.h"
#import "ProfileViewController.h"

@interface ViewController ()
@property CGPoint cardInitialCenter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showDetails
{
    ProfileViewController *profile = (ProfileViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"com.yahoo.details"];
    //profile.profileCardView.image = self.cardView.image;

    CGFloat width =  self.cardView.image.size.width;
    CGFloat height = self.cardView.image.size.height;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), YES, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    [self.cardView.image drawInRect:CGRectMake(0, 0, width, height)];
    UIGraphicsPopContext();
    //profile.profileCardView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //NSLog(@"-------%@", outputImage);
    [profile.img setImage:outputImage];
    
    //NSLog(@"=======%@", profile.img.image);
    
    [self presentViewController:profile animated:YES completion:nil];
    
}

- (IBAction)onTabCard:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    self.cardInitialCenter = self.cardView.center;
    self.cardView.center = CGPointMake(self.cardInitialCenter.x, point.y);
    if(sender.state == UIGestureRecognizerStateEnded){
        //NSLog(@"end");
        [self showDetails];
    }

}

@end
