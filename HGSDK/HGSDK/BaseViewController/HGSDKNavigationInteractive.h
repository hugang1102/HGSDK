//
//  HGSDKNavigationInteractive.h
//  HGSDK
//
//  Created by 49you on 2018/5/30.
//  Copyright © 2018年 49you. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGSDKNavigationInteractive : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;

- (void)addGestureToVC:(UIViewController *)vc;

@end
