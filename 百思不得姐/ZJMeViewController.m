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
    //设置导航栏按钮
    self.navigationItem.rightBarButtonItems=
  @[
    [UIBarButtonItem itemWithImageName:@"mine-setting-icon"
                             highImage:@"mine-setting-icon-click"
                                target:self
                                action:@selector(settingButtonClick)]
        ,
    [UIBarButtonItem itemWithImageName:@"mine-moon-icon"
                             highImage:@"mine-moon-icon-click"
                                target:self
                                action:@selector(nightModeButtonClick)]
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
