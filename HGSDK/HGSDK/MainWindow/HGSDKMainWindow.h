//
//  HGSDKMainWindow.h
//  HGSDK
//
//  Created by 49you on 2018/5/28.
//  Copyright © 2018年 49you. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HGSDKMainWindowTouchEventDelegate <NSObject>

- (BOOL)shouldHandleTouchAtPoint:(CGPoint)pointInWindow;

@end

@interface HGSDKMainWindow : UIWindow

@property (nonatomic, assign) id<HGSDKMainWindowTouchEventDelegate> delegate; // 触摸事件代理

+ (instancetype)shareWindow;

@end
