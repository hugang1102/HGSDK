//
//  HGFloatViewManager.m
//  HGSDK
//
//  Created by 49you on 2018/5/28.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDKFloatViewManager.h"
#import "HGSDKMainWindow.h"
#import "HGSDKFloatViewController.h"
#import "HGSDKUIManager.h"

@interface HGSDKFloatViewManager()


@end

@implementation HGSDKFloatViewManager

+ (instancetype)shareInstance
{
    static HGSDKFloatViewManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HGSDKFloatViewManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)show
{
    [[HGSDKUIManager shareManager] presentVC:[HGSDKFloatViewController new]];
}

- (void)hide
{
    [HGSDKMainWindow shareWindow].hidden = YES;
}

@end
