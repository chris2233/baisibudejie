//
//  ZJFriendTrendsViewController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/8.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJFriendTrendsViewController.h"

@interface ZJFriendTrendsViewController ()

@end

@implementation ZJFriendTrendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"我的关注";
    //设置导航栏左边的按钮
    UIButton *friendButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [friendButton  setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:(UIControlStateNormal)];
    [friendButton  setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] forState:(UIControlStateHighlighted)];
    //设置button的方法
    [friendButton  addTarget:self action:@selector(friendButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    friendButton .size = friendButton .currentBackgroundImage.size;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:friendButton ];
}

-(void)friendButtonClick
{
    ZJLogFunc;
}

@end
