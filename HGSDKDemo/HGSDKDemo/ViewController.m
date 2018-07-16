//
//  ViewController.m
//  HGSDKDemo
//
//  Created by 49you on 2018/5/28.
//  Copyright © 2018年 49you. All rights reserved.
//

#import "ViewController.h"
#import <HGSDK/HGSDK.h>

@interface ViewController ()<HGSDKDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *funcArr;
@property (weak, nonatomic) IBOutlet UITableView *funcTabView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)funcArr
{
    if (_funcArr == nil) {
        _funcArr = [[NSArray alloc] initWithObjects:@"初始化",@"登录",@"注销", nil];
    }
    return _funcArr;
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.funcArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"funcCell" forIndexPath:indexPath];
    cell.textLabel.text = self.funcArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            // 初始化
            [HGSDK initSDKWithAppId:@"111" appKey:@"222" sdkDelegate:self];
        }
            break;
        case 1:
        {
            // 登录
            [HGSDK login];
        }
            break;
        case 2:
        {
            // 注销
            [HGSDK logout];
        }
            break;
            
        default:
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

#pragma mark - HGSDKDelegate

- (void)HGSDKInitResult:(BOOL)success error:(NSError *)error
{
    if (success) {
        NSLog(@"初始化成功");
    } else {
        NSLog(@"初始化失败:%ld，%@",(long)error.code,error.localizedDescription);
    }
}
- (void)HGSDKLoginResult:(BOOL)success error:(NSError *)error
{
    
}
- (void)HGSDKLogoutResult:(BOOL)success error:(NSError *)error
{
    
}

@end
