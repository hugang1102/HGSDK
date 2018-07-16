//
//  HGSDKMainNVC.m
//  HGSDK
//
//  Created by 49you on 2018/5/29.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDKMainNVC.h"
#import "HGSDKAnimationTransitioning.h"
#import "HGSDKUIManager.h"
#import "HGSDKNavigationTransition.h"
#import "HGSDKNavigationInteractive.h"

@interface HGSDKMainNVC ()<UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@end

@implementation HGSDKMainNVC

- (void)setInteractive:(HGSDKNavigationInteractive *)interactive
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setInteractive:nil];
    // Do any additional setup after loading the view.
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    self.view.frame = CGRectMake(0, 0, screenBounds.size.width*0.5, screenBounds.size.height*0.5);
    self.view.center = CGPointMake([[[UIApplication sharedApplication] keyWindow] rootViewController].view.bounds.size.width / 2, [[[UIApplication sharedApplication] keyWindow] rootViewController].view.bounds.size.height / 2);
    
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    
    self.delegate = self;
    
    _interactive = [[HGSDKNavigationInteractive alloc] init];
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
    self.view.center = CGPointMake([[[UIApplication sharedApplication] keyWindow] rootViewController].view.bounds.size.width / 2, [[[UIApplication sharedApplication] keyWindow] rootViewController].view.bounds.size.height / 2);
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

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    HGSDKNavigationTransitionType type = 0;
    switch (operation) {
        case UINavigationControllerOperationPush:
            type = HGSDKNavigationTransitionTypePush;
            break;
        case UINavigationControllerOperationPop:
            type = HGSDKNavigationTransitionTypePop;
            break;
            
        default:
            break;
    }
    return [[HGSDKNavigationTransition alloc] initWithType:type];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return _interactive.interacting ? _interactive : nil;
}

@end
