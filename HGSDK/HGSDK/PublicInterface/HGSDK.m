//
//  HGSDK.m
//  HGSDK
//
//  Created by 49you on 2018/5/28.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDK.h"
#import "HGSDKFloatViewManager.h"
#import "HGSDKLoginViewController.h"
#import "HGSDKUIManager.h"
#import "HGSDKMainNVC.h"

@interface HGSDK()
@property (nonatomic, assign) id<HGSDKDelegate> sdkDelegate;
@end

@implementation HGSDK

+ (instancetype)shareInstance
{
    static HGSDK *sdk = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sdk = [[HGSDK alloc] init];
    });
    return sdk;
}

+ (void)initSDKWithAppId:(NSString *)appId appKey:(NSString *)appKey sdkDelegate:(id<HGSDKDelegate>)sdkDelegate
{
    HGSDK *sdk = [HGSDK shareInstance];
    sdk.sdkDelegate = sdkDelegate;
    [sdk initSDKWithAppId:appId andAppKey:appKey];
}

- (void)initSDKWithAppId:(NSString *)appId andAppKey:(NSString *)appKey
{
    BOOL success = NO;
    NSError *error = nil;
    if (self.sdkDelegate && [self.sdkDelegate respondsToSelector:@selector(HGSDKInitResult:error:)]) {
        if ([appId isEqualToString:@"111"]) {
            success = YES;
            error = nil;
        } else {
            success = NO;
            error = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:-1 userInfo:@{NSLocalizedDescriptionKey:@"appid错误"}];
        }
        [self.sdkDelegate HGSDKInitResult:success error:error];
    } else {
        NSLog(@"没有实现代理方法\n");
    }
}

+ (void)login
{
    HGSDKMainNVC *nvc = [[HGSDKMainNVC alloc] initWithRootViewController:[HGSDKLoginViewController new]];
    [[HGSDKUIManager shareManager] presentVC:nvc];
}

+ (void)logout
{
    NSLog(@"注销");
}

@end
