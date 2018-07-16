//
//  HGSDKUIManager.h
//  HGSDK
//
//  Created by 49you on 2018/5/29.
//  Copyright © 2018年 49you. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface HGSDKUIManager : NSObject

+ (instancetype)shareManager;

- (void)presentVC:(UIViewController *)vc;

- (void)dismissVC:(UIViewController *)vc;

- (void)pushVC:(UIViewController *)vc;

- (void)popVC:(UIViewController *)vc;

@end
