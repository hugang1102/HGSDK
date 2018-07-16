//
//  HGSDKNavigationInteractive.m
//  HGSDK
//
//  Created by 49you on 2018/5/30.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDKNavigationInteractive.h"

@interface HGSDKNavigationInteractive()

@property (nonatomic, assign) BOOL shouldComplete;
@property (nonatomic, strong) UIViewController *pushingVC;

@end

@implementation HGSDKNavigationInteractive

- (void)addGestureToVC:(UIViewController *)vc
{
    self.pushingVC = vc;
    
    UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePopRecognizer:)];
    [vc.view addGestureRecognizer:popRecognizer];
}

- (void)handlePopRecognizer:(UIScreenEdgePanGestureRecognizer*)recognizer {
    CGPoint translation = [recognizer translationInView:recognizer.view];
    CGFloat fraction = translation.x / self.pushingVC.view.frame.size.width;
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            // 1、
            self.interacting = YES;
            [self.pushingVC.navigationController popViewControllerAnimated:YES];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self updateInteractiveTransition:fraction];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            //手势完成后结束标记并且判断移动距离是否过半，过则finishInteractiveTransition完成转场操作，否者取消转场操作
            self.interacting = NO;
            if (fraction > 0.5) {
                [self finishInteractiveTransition];
            }else{
                [self cancelInteractiveTransition];
            }
        }
            break;
            
        default:
            break;
    }
}

@end
