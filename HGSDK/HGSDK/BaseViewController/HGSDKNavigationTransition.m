//
//  HGSDKPushTransition.m
//  HGSDK
//
//  Created by 49you on 2018/5/30.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDKNavigationTransition.h"

@interface HGSDKNavigationTransition()

@property (nonatomic, assign) HGSDKNavigationTransitionType type;

@end

@implementation HGSDKNavigationTransition

- (instancetype)initWithType:(HGSDKNavigationTransitionType)type
{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (_type) {
        case HGSDKNavigationTransitionTypePush:
        {
            [self pushAnimation:transitionContext];
        }
            break;
        case HGSDKNavigationTransitionTypePop:
        {
            [self popAnimation:transitionContext];
        }
            break;
            
        default:
            break;
    }
}

- (void)pushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(fromVC.view.frame, fromVC.view.frame.size.width, 0);
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)popAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect finalFrame = CGRectOffset(fromVC.view.frame, fromVC.view.frame.size.width, 0);
    fromVC.view.frame = initFrame;
    [containerView addSubview:fromVC.view];
    // 关键
    [containerView insertSubview:toVC.view atIndex:0];

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        fromVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        //由于加入了手势必须判断
        if ([transitionContext transitionWasCancelled]) {
            fromVC.view.frame = initFrame;
        }
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];

}

@end
