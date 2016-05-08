//
//  ZJMeViewController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/8.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJMeViewController.h"

@interface ZJMeViewController ()

@end

@implementation ZJMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置题目
    self.navigationItem.title = @"我的";
    
    //设置导航栏setting的按钮
    UIButton *settingButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [settingButton  setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon"] forState:(UIControlStateNormal)];
    [settingButton  setBackgroundImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:(UIControlStateHighlighted)];
    settingButton.size = settingButton.currentBackgroundImage.size;
    //设置button的方法
    [settingButton  addTarget:self action:@selector(settingButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    //设置导航栏nightMode按钮
    UIButton *nightModeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [nightModeButton  setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon"] forState:(UIControlStateNormal)];
    [nightModeButton  setBackgroundImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:(UIControlStateHighlighted)];
    //设置button的方法
    [nightModeButton  addTarget:self action:@selector(nightModeButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    nightModeButton.size = nightModeButton.currentBackgroundImage.size;
    self.navigationItem.rightBarButtonItems= @[
        [[UIBarButtonItem alloc]initWithCustomView:settingButton],
        [[UIBarButtonItem alloc] initWithCustomView:nightModeButton]
        ];
}

-(void)settingButtonClick
{
    ZJLogFunc;
}

-(void)nightModeButtonClick
{
    ZJLogFunc;
}

@end
