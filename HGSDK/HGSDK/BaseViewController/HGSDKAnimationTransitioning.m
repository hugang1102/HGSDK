//
//  HGSDKAnimationTransitioning.m
//  HGSDK
//
//  Created by 49you on 2018/5/29.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDKAnimationTransitioning.h"
#import "HGSDKMainWindow.h"

@interface HGSDKAnimationTransitioning()

@property (nonatomic, assign) HGSDKAnimationTransitioningType transitioningType;

@end

@implementation HGSDKAnimationTransitioning

- (instancetype)initWithTransitioningType:(HGSDKAnimationTransitioningType)transitioningType
{
    self = [super init];
    if (self) {
        _transitioningType = transitioningType;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    switch (_transitioningType) {
        case HGSDKAnimationTransitioningTypePresent:
        {
            [self setAnimatedPresent:transitionContext];
        }
            break;
        case HGSDKAnimationTransitioningTypeDismiss:
        {
            [self setAnimatedDismiss:transitionContext];
        }
            break;
            
        default:
            break;
    }
}

- (void)setAnimatedPresent:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 1、从转场上下文获取控制器
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2、设置切入控制器的初始frame
//    CGRect screenBounds = [[UIScreen mainScreen] bounds];

    toVC.view.alpha = 0;
    // 3、把切入控制器的view添加到容器containerView中
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    // 4、开始动画
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
     // 模拟弹簧效果
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         toVC.view.alpha = 1;
                     } completion:^(BOOL finished) {
                         // 5、完成转场
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)setAnimatedDismiss:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    fromVC.view.alpha = 1;
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                     }];
}

@end
