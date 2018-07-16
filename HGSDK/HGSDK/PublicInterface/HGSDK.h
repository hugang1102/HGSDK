//
//  HGSDK.h
//  HGSDK
//
//  Created by 49you on 2018/5/28.
//  Copyright © 2018年 49you. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HGSDKDelegate <NSObject>
@optional
- (void)HGSDKInitResult:(BOOL)success error:(NSError *)error;
- (void)HGSDKLoginResult:(BOOL)success error:(NSError *)error;
- (void)HGSDKLogoutResult:(BOOL)success error:(NSError *)error;
@end

@interface HGSDK : NSObject

/**
 SDK初始化

 @param appId appid
 @param appKey appkey
 */
+ (void)initSDKWithAppId:(NSString *)appId appKey:(NSString *)appKey sdkDelegate:(id<HGSDKDelegate>)sdkDelegate;

/**
 登录
 */
+ (void)login;

/**
 注销
 */
+ (void)logout;

@end
