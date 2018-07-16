//
//  HGSDKUIManager.m
//  HGSDK
//
//  Created by 49you on 2018/5/29.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDKUIManager.h"
#import "HGSDKMainWindow.h"

@interface HGSDKUIManager()

@end

@implementation HGSDKUIManager

+ (instancetype)shareManager
{
    static HGSDKUIManager *manager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        manager = [[HGSDKUIManager alloc] init];
    });
    return manager;
}

- (void)presentVC:(UIViewController *)vc
{
    [HGSDKMainWindow shareWindow].hidden = NO;
    
    UIViewController *tmpVC = [HGSDKMainWindow shareWindow].rootViewController.presentedViewController;
    
    if (tmpVC) {
        [tmpVC dismissViewControllerAnimated:NO completion:nil];
    }

    [[HGSDKMainWindow shareWindow].rootViewController presentViewController:vc animated:NO completion:nil];
}

- (void)dismissVC:(UIViewController *)vc
{
    [vc dismissViewControllerAnimated:YES completion:nil];
    
    UIViewController *tmpVC = [HGSDKMainWindow shareWindow].rootViewController.presentedViewController;
    
    if (!tmpVC) {
        [HGSDKMainWindow shareWindow].hidden = YES;
    }
}

- (void)pushVC:(UIViewController *)vc
{
    
}

- (void)popVC:(UIViewController *)vc
{
    [vc.navigationController popViewControllerAnimated:YES];
}

@end
