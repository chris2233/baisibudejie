//
//  ZJNewViewController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/8.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJNewViewController.h"

@interface ZJNewViewController ()

@end

@implementation ZJNewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置导航栏的内容
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置导航栏左边的按钮
    UIButton *tapButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [tapButton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:(UIControlStateNormal)];
    [tapButton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:(UIControlStateHighlighted)];
    //设置button的方法
    [tapButton addTarget:self action:@selector(tapClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    tapButton.size = tapButton.currentBackgroundImage.size;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:tapButton];
}

-(void)tapClick
{
    ZJLogFunc;
}

@end
