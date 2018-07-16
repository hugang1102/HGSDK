//
//  HGFloatViewManager.h
//  HGSDK
//
//  Created by 49you on 2018/5/28.
//  Copyright © 2018年 49you. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGSDKFloatViewManager : NSObject

+ (instancetype)shareInstance;

- (void)show;

- (void)hide;

@end
