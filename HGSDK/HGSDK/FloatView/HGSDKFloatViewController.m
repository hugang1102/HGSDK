//
//  HGSDKFloatViewController.m
//  HGSDK
//
//  Created by 49you on 2018/5/28.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDKFloatViewController.h"
#import "HGSDKFloatView.h"
#import "HGSDKMainWindow.h"

@interface HGSDKFloatViewController ()<HGSDKMainWindowTouchEventDelegate>

@property (nonatomic, strong) HGSDKFloatView *floatView;

@end

@implementation HGSDKFloatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.floatView.backgroundColor = [UIColor redColor];
    
    [HGSDKMainWindow shareWindow].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (HGSDKFloatView *)floatView
{
    if (!_floatView)
    {
        _floatView = [[HGSDKFloatView alloc] init];
        [_floatView setTitle:@"浮点"];
        [self.view addSubview:_floatView];
    }
    return _floatView;
}

- (BOOL)shouldHandleTouchAtPoint:(CGPoint)pointInWindow
{
    BOOL shouldReceiveTouch = NO;
    
    CGPoint pointInLocalCoordinates = [self.view convertPoint:pointInWindow fromView:nil];
    
    if (CGRectContainsPoint(self.floatView.frame, pointInLocalCoordinates))
    {
        shouldReceiveTouch = YES;
    }
    
    return shouldReceiveTouch;
}

@end
