//
//  HGSDKFloatView.m
//  HGSDK
//
//  Created by 49you on 2018/5/28.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDKFloatView.h"

#define kFloatViewWidth 45.0
#define kFloatViewHeight 45.0

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface HGSDKFloatView()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HGSDKFloatView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor purpleColor];
        self.frame = CGRectMake(0, 0, kFloatViewWidth, kFloatViewHeight);
        
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.text = @"浮点";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

//
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

// 跟随手指移动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point1 = [touches.anyObject previousLocationInView:self.superview];
    CGPoint point2 = [touches.anyObject locationInView:self.superview];
    
    CGPoint initPoint = self.frame.origin;
    
    
    
    CGFloat x = initPoint.x+point2.x-point1.x;
    CGFloat y = initPoint.y+point2.y-point1.y;
    
    if (x < 0) {
        x = 0;
    } else if (x > kScreenWidth) {
        x = kScreenWidth-kFloatViewWidth;
    }
    
    if (y < 0) {
        y = 0;
    } else if (y > kScreenHeight) {
        y = kScreenHeight-kFloatViewHeight;
    }
    
    self.frame = CGRectMake(x, y, kFloatViewWidth, kFloatViewHeight);
}

// 结束或者取消时就自动吸附,左右吸附
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self autoGotoScreenBoder:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self autoGotoScreenBoder:touches withEvent:event];
}

- (void)autoGotoScreenBoder:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = self.center;
    
    CGFloat x = 0;
    CGFloat y = self.frame.origin.y;
    
    if (point.x <= kScreenWidth*0.5) {
        x = 0;
    } else {
        x = kScreenWidth-kFloatViewWidth;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(x, y, kFloatViewWidth, kFloatViewHeight);
    }];
    
}

@end
