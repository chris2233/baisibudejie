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
    //设置导航栏图片
    self.navigationItem.leftBarButtonItem =
    [UIBarButtonItem itemWithImageName:@"friendsRecommentIcon"
                             highImage:@"friendsRecommentIcon-click"
                                target:self
                                action:@selector(friendButtonClick)];
}

-(void)friendButtonClick
{
    ZJLogFunc;
}

@end
