//
//  ZJNavigationController.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/9.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJNavigationController.h"

@interface ZJNavigationController ()

@end

@implementation ZJNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//拦截所有push的事件，让所有的返回按钮都设置成返回
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0)//如果push进来不是第一个控制器
    {
        
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:(UIControlStateNormal)];
        
    //设置button的图片：注意这里不是backgroundimage！
    [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:(UIControlStateNormal)];
    [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:(UIControlStateHighlighted)];
    [button sizeToFit];
     //设置button字体颜色
    [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor redColor]   forState:(UIControlStateHighlighted)];
    //设置button的方法
    [button addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
    //让button里面的内容全部左对齐
    button.size = CGSizeMake(70, 30);
    button.contentHorizontalAlignment = 1;
    //让button里面的内容再向左平易
    button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    //隐藏tabbar
    viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:YES];
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}

@end
