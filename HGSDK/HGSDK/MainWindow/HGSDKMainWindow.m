//
//  HGSDKMainWindow.m
//  HGSDK
//
//  Created by 49you on 2018/5/28.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDKMainWindow.h"
#import "HGSDKRootViewController.h"

@implementation HGSDKMainWindow

+ (instancetype)shareWindow
{
    static HGSDKMainWindow *win = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        win = [[HGSDKMainWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    });
    return win;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = NO;
        self.windowLevel = UIWindowLevelAlert;
        self.backgroundColor = [UIColor clearColor];
        self.rootViewController = [[HGSDKRootViewController alloc] init];
    }
    return self;
}

// 事件传递
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL receivedTouch = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(shouldHandleTouchAtPoint:)]) {
        if ([self.delegate shouldHandleTouchAtPoint:point]) {
            receivedTouch = [super pointInside:point withEvent:event];
        } else {
            receivedTouch = NO;
        }
    }
    
    return receivedTouch;
}

@end
