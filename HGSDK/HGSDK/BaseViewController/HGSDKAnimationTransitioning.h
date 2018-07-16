//
//  HGSDKAnimationTransitioning.h
//  HGSDK
//
//  Created by 49you on 2018/5/29.
//  Copyright © 2018年 49you. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HGSDKAnimationTransitioningType) {
    HGSDKAnimationTransitioningTypePresent = 0,
    HGSDKAnimationTransitioningTypeDismiss,
};

@interface HGSDKAnimationTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithTransitioningType:(HGSDKAnimationTransitioningType)transitioningType;

@end
