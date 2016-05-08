//
//  ZJEssenceViewController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/8.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJEssenceViewController.h"

@interface ZJEssenceViewController ()

@end

@implementation ZJEssenceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置导航栏的内容
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //设置导航栏的按钮
    self.navigationItem.leftBarButtonItem =
    [UIBarButtonItem itemWithImageName: @"MainTagSubIcon"
                             highImage:@"MainTagSubIconClick"
                                target:self
                                action:@selector(tapClick)];
}

-(void)tapClick
{
    ZJLogFunc;
}

@end
