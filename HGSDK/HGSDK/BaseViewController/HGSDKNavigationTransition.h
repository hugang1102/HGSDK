//
//  HGSDKPushTransition.h
//  HGSDK
//
//  Created by 49you on 2018/5/30.
//  Copyright © 2018年 49you. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HGSDKNavigationTransitionType) {
    HGSDKNavigationTransitionTypePush = 0,
    HGSDKNavigationTransitionTypePop,
};

@interface HGSDKNavigationTransition : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithType:(HGSDKNavigationTransitionType)type;

@end
