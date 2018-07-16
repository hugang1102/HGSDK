//
//  HGSDKLoginViewController.m
//  HGSDK
//
//  Created by 49you on 2018/5/29.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "HGSDKLoginViewController.h"
#import "HGSDKRegisterViewController.h"
#import "HGSDKUIManager.h"
#import "Masonry.h"
#import "HGSDKFloatViewManager.h"

@interface HGSDKLoginViewController ()

@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *registerBtn;


@end

@implementation HGSDKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configVC];
    [self configConstrant];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configVC
{
    self.view.backgroundColor = [UIColor greenColor];
    
    self.title = @"登录";
}

- (void)configConstrant
{
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10.0);
        make.top.mas_equalTo(44.0);
        make.width.mas_equalTo(30.0);
        make.height.mas_equalTo(20.0);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30.0);
        make.top.mas_equalTo(80.0);
        make.width.mas_equalTo(30.0);
        make.height.mas_equalTo(20.0);
    }];
}

- (void)registerBtnClick:(id)sender
{
    [self.navigationController pushViewController:[HGSDKRegisterViewController new] animated:YES];
}

- (void)loginBtnClick:(id)sender
{
    [[HGSDKFloatViewManager shareInstance] show];
}

#pragma mark - getter

- (UIButton *)registerBtn
{
    if (_registerBtn == nil) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _registerBtn.backgroundColor = [UIColor purpleColor];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [self.view addSubview:_registerBtn];
    }
    return _registerBtn;
}

- (UIButton *)loginBtn
{
    if (_loginBtn == nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _loginBtn.backgroundColor = [UIColor purpleColor];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [self.view addSubview:_loginBtn];
    }
    return _loginBtn;
}

@end
