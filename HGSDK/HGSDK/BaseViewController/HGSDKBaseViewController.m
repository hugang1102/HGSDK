//
//  HGSDKBaseViewController.m
//  HGSDK
//
//  Created by 49you on 2018/5/29.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDKBaseViewController.h"
#import "HGSDKAnimationTransitioning.h"
#import "HGSDKUIManager.h"

@interface HGSDKBaseViewController ()<UIViewControllerTransitioningDelegate>


@end

@implementation HGSDKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    self.view.frame = CGRectMake(0, 0, screenBounds.size.width*0.5, screenBounds.size.height*0.5);
    
    UIBarButtonItem *close = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(btnClicked:)];
    self.navigationItem.rightBarButtonItem = close;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    self.view.frame = CGRectMake(0, 0, screenBounds.size.width*0.5, screenBounds.size.height*0.5);
}

- (void)btnClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];

}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[HGSDKAnimationTransitioning alloc] initWithTransitioningType:HGSDKAnimationTransitioningTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[HGSDKAnimationTransitioning alloc] initWithTransitioningType:HGSDKAnimationTransitioningTypeDismiss];
}


@end
